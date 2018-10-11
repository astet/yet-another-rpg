#pragma once

#include <shiva/world/world.hpp>
#include <shiva/lua/lua_system.hpp>
#include <shiva/ecs/opaque_data.hpp>

namespace rpg
{
    class world : public ::shiva::world
    {
    public:
        ~world() noexcept = default;

        world() noexcept
        {
            bool res = system_manager_.load_plugins();
            if (!res) {
                std::cerr << "error loading plugins" << std::endl;
            } else {
                system_manager_.prioritize_system("imgui_system", "render_system", shiva::ecs::system_type::post_update);
                auto &lua_system = system_manager_.create_system<shiva::scripting::lua_system>();
                auto render_system = system_manager_.get_system_by_name("render_system",
                                                                        shiva::ecs::system_type::post_update);
                auto input_system = system_manager_.get_system_by_name("input_system",
                                                                       shiva::ecs::system_type::pre_update);
                auto resources_system = system_manager_.get_system_by_name("resources_system",
                                                                           shiva::ecs::system_type::pre_update);
                auto animation_system = system_manager_.get_system_by_name("animation_system",
                                                                           shiva::ecs::system_type::logic_update);
                auto imgui_system = system_manager_.get_system_by_name("imgui_system",
                                                                       shiva::ecs::system_type::post_update);
                auto video_system = system_manager_.get_system_by_name("video_system", shiva::ecs::system_type::logic_update);

                if (render_system != nullptr &&
                    animation_system != nullptr &&
                    resources_system != nullptr &&
                    input_system != nullptr &&
                    imgui_system != nullptr &&
                    video_system != nullptr) {
                    shiva::ecs::opaque_data full_data;
                    full_data.data_1 = &lua_system.get_state();
                    full_data.data_2 = render_system->get_user_data();
                    resources_system->set_user_data(&full_data);
                    animation_system->set_user_data(&lua_system.get_state());
                    input_system->set_user_data(render_system->get_user_data());
                    imgui_system->set_user_data(&lua_system.get_state());
                    video_system->set_user_data(&full_data);
                    lua_system.load_all_scripted_systems();
                }
            }
        }
    };
}
