if (PROJECT_COVERAGE)
    if (GCC)
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} --coverage")
        message(STATUS "Coverage enabled new cxxflags are ${CMAKE_CXX_FLAGS_DEBUG}")
    endif()
endif()

