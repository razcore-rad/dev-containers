#include "iostream"

#include "GLFW/glfw3.h"
#include "webgpu/webgpu.h"

#ifdef WEBGPU_BACKEND_WGPU
#include "webgpu/wgpu.h"
#define wgpuInstanceRelease wgpuInstanceDrop
#endif

int main(int, char **) {
  WGPUInstanceDescriptor desc;
  desc.nextInChain = nullptr;

  WGPUInstance instance = wgpuCreateInstance(&desc);
  if (instance == nullptr) {
    std::cerr << "Could not initialize WebGPU!" << std::endl;
    return 1;
  }

  std::cout << "WGPU instance: " << instance << std::endl;

  if (glfwInit() == GLFW_FALSE) {
    std::cerr << "Could not initialize GLFW!" << std::endl;
    return 1;
  };

  GLFWwindow *window =
      glfwCreateWindow(640, 480, "Learn WebGPU", nullptr, nullptr);
  if (window == nullptr) {
    std::cerr << "Could not open window!" << std::endl;
    glfwTerminate();
    return 1;
  }

  while (!glfwWindowShouldClose(window)) {
    glfwPollEvents();
  }

  wgpuInstanceRelease(instance);
  glfwDestroyWindow(window);
  glfwTerminate();
  return 0;
}
