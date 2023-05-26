# Docker Development Containers

These are containers for personal use to keep my machine clean of development and tool libraries.

Containers:

- `razcorarad/ide.helix`
  - From `ubuntu:lunar`
  - With `nushell`, `helix`
  - Includes config files for `nushell`, `helix`
  - Used as the "minimal tools" base container

- `razcorerad/cxx.dev`
  - From `razcorerad/ide.helix`
  - With `clangd`, `clang-format`, `meson` for building `c`, `cpp` apps with `helix` as IDE
  - Used as the base container for `c`, `cpp` development

- `razcorerad/opengl.dev`
  - From `razcorerad/cxx.dev`
  - With `libglfw3-dev`
  - Includes a `docker-run.nu` script for running the `opengl.dev` container with X11 for running GUI apps
  - Used for learning OpenGL
