#import <Foundation/Foundation.h>

@interface PropertyContainer : NSObject

@property (copy) NSObject *prop1;
@property (copy) NSMutableArray *prop2;
@property (readonly) NSMutableArray *prop3;

- (NSMutableArray *)customGetterForProp2;
- (void)customSetterForProp3:(NSMutableArray *)prop3;

@end
