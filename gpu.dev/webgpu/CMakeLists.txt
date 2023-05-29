cmake_minimum_required(VERSION 3.0...3.25)
project(
    LearnWebGPU
    VERSION 0.1.0
    LANGUAGES C CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(subprojects/wgpu)

add_executable(app src/main.cpp)
set_target_properties(app PROPERTIES
    CXX_STANDARD 20
    COMPILE_WARNING_AS_ERROR ON
)
if (MSVC)
    target_compile_options(app PRIVATE /W4)
else()
    target_compile_options(app PRIVATE -Wall -Wextra -pedantic)
endif()

target_link_libraries(app PRIVATE glfw webgpu)
target_copy_webgpu_binaries(app)
