if (UNIX AND NOT APPLE)
    set(LINUX TRUE)
endif ()

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(CLANG TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    set(GCC TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    set(ICC TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    set(MSVC TRUE)
endif()

