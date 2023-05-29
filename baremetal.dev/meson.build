project('app', 'cpp', default_options: ['warning_level=3', 'cpp_std=c++20'])

cpp = meson.get_compiler('cpp')
message(cpp.cmd_array())
message(cpp.get_linker_id())

dependencies = []

sources = [
  'src/main.cpp'
]

executable(meson.project_name(), sources, dependencies: dependencies, cpp_args: ['-DDEBUG=1'])
