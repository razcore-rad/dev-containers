#include "functional"
#include "iostream"
#include "vector"

void for_each(const std::vector<int> &values, std::function<void(int &)> func) {
  for (int value : values) {
    func(value);
  }
}

int main() {
  std::vector<int> values{1, 5, 3, 4, 2};
  auto lambda = [](int &value) {
    std::cout << "value: " << value << std::endl;
  };
  for_each(values, lambda);
  return 0;
}