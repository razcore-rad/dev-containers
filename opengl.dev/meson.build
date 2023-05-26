project('app', 'c', 'cpp', default_options: 'prefer_static=true')
dependencies = [
  dependency('gl'),
  dependency('glfw3')
]
source = [
  'src/main.cpp'
]
executable(meson.project_name(), source, dependencies: dependencies)
