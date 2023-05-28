#include "iostream"

struct Log {
  enum Level : unsigned char { ERROR, WARNING, INFO };

  Level log_level = Level::INFO;

  void error(const char *message) {
    if (log_level >= Level::ERROR)
      std::cout << "[ERROR]:" << message << std::endl;
  };

  void warn(const char *message) {
    if (log_level >= Level::WARNING)
      std::cout << "[WARNING]:" << message << std::endl;
  };

  void info(const char *message) {
    if (log_level >= Level::INFO)
      std::cout << "[INFO]:" << message << std::endl;
  };
};

struct Entity {
  float x = 0.0f;
  float y = 0.0f;

  Entity() { std::cout << "Created Entity!" << std::endl; }
  ~Entity() { std::cout << "Destroyed Entity!" << std::endl; };

  void print() { std::cout << x << ", " << y << std::endl; }
};

int main() {
  Log log;
  log.log_level = Log::Level::WARNING;
  log.warn("Hello!");
  log.info("HEllo");
  log.error("H");

  Entity e;
  e.print();

  return 0;
}