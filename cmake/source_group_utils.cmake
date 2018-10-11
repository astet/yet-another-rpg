macro(add_source_group_now)
	if (WIN32)
		source_group("shiva\\ecs" FILES ${SHIVA_WIN32_ECS_PUBLIC_MODULE_SOURCES})
		source_group("shiva\\ecs\\details" FILES ${SHIVA_WIN32_ECS_PRIVATE_MODULE_SOURCES})
	endif()
endmacro()

