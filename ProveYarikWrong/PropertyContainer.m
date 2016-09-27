#import "PropertyContainer.h"

@implementation PropertyContainer

- (NSMutableArray *)customGetterForProp2 {
	return _prop2;
}

- (void)customSetterForProp3:(NSMutableArray *)prop3 {
	
	_prop3 = prop3;
}

@end
