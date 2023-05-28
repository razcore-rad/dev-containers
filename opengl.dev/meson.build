project('app', 'cpp', default_options : ['warning_level=3', 'cpp_std=c++20'])

dependencies = [
  dependency('gl'),
  dependency('glew'),
  dependency('glfw3')
]
source = [
  'src/main.cpp'
]
executable(meson.project_name(), sources, dependencies: dependencies, cpp_args: ['-DDEBUG=1'])

