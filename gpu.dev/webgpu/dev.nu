export extern "dev build" [...argv: string] {
  cmake . -B build -G Ninja
  cmake --build build
}
