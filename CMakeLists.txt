cmake_minimum_required(VERSION 3.10)
project(rpg)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(external/shiva)

##! CMake Path
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(library)

##! Shiva
#find_package(shiva CONFIG REQUIRED)
#find_package(shiva-sfml CONFIG REQUIRED)
#find_package(shiva-box2d CONFIG REQUIRED)
#find_package(shiva-imgui CONFIG REQUIRED)

##! Sources
file(GLOB_RECURSE RPG_SOURCES src/*.cpp prerequisites/*.cpp)
file(GLOB_RECURSE RPG_HEADERS src/*.hpp)

##! Executable
add_executable(rpg ${RPG_SOURCES} ${RPG_HEADERS})

##! Linking
##! We manualy link LUA_LIBRARIES on Windows,
##! CMake seems to have a bug on interfacing this libraries from the module shiva::lua
target_link_libraries(rpg PUBLIC
        shiva::shiva
        ${LUA_LIBRARIES})

set_target_properties(rpg
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin"
        LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin"
        RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin"
        RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin"
        PDB_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        PDB_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin"
        PDB_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin")

add_dependencies(rpg
        shiva::shiva-system-sfml-graphics
        shiva::shiva-system-sfml-inputs
        shiva::shiva-system-sfml-resources
        shiva::shiva-system-sfml-animation
        shiva::shiva-system-imgui
        shiva::shiva-system-sfml-video)

##! Helpers
macro(add_scene scene_name)
    configure_file(${CMAKE_SOURCE_DIR}/assets/scripts/scenes/lua/${scene_name}
            ${CMAKE_SOURCE_DIR}/bin/assets/scripts/scenes/lua/${scene_name}
            COPYONLY)
endmacro()

macro(add_resource resource_name resource_type scene_name)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/assets/${resource_type}/${scene_name}/${resource_name}
            ${CMAKE_SOURCE_DIR}/bin/assets/${resource_type}/${scene_name}/${resource_name}
            COPYONLY)
endmacro()


##! Scenes
add_scene(game_scene.lua)
add_scene(intro_scene.lua)

##! Resources
add_resource(intro.avi videos intro_scene)


configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config/sfml_config.json
        ${CMAKE_SOURCE_DIR}/bin/assets/cfg/sfml_config.json
        COPYONLY)
