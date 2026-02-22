#import <Foundation/Foundation.h>
#import <iostream>

@interface MyObjectiveCClass : NSObject
@end

int main() {
  std::cout << "Hello from C++!" << std::endl;
  MyObjectiveCClass *obj = [[MyObjectiveCClass alloc] init];
  [obj someObjectiveCMethod];
  return 0;
}