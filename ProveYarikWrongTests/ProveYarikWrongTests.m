#import <XCTest/XCTest.h>
#import "PropertyContainer.h"

@interface ProveYarikWrongTests : XCTestCase

@end

@implementation ProveYarikWrongTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProp1_1 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	// cannot use non-mutable string, as it uses compiler optimizations, and copied instance pointer will point to the same addres
	NSMutableString *testObj = [@"test" mutableCopy];
	sut.prop1 = testObj;
	XCTAssert(testObj != sut.prop1);
}

- (void)testProp1_2 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableString *testObj = [@"test" mutableCopy];
	sut.prop1 = testObj;
	NSObject *result1 = sut.prop1;
	NSObject *result2 = sut.prop1;
	XCTAssert(testObj != result1);
	XCTAssert(testObj != result2);
}

- (void)testProp1_3 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableString *testObj = [@"test" mutableCopy];
	sut.prop1 = testObj;
	NSObject *result1 = sut.prop1;
	NSObject *result2 = sut.prop1;
	XCTAssert(result1 == result2);
}

- (void)testProp2_1 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableArray *testObj = [@[@"test"] mutableCopy];
	sut.prop2 = testObj;
	NSMutableArray *result1 = sut.prop2;
	NSMutableArray *result2 = sut.prop2;
	XCTAssert(result1 == result2);
}

- (void)testProp2_2 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableArray *testObj = [@[@"test"] mutableCopy];
	sut.prop2 = testObj;
	[testObj addObject:@"test2"];
	NSMutableArray *result = sut.prop2;
	XCTAssert([result isEqual:@[@"test"]]);
}

// getter does not return NSMutableArray but NSArray
- (void)testProp2_3 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableArray *testObj = [@[@"test"] mutableCopy];
	sut.prop2 = testObj;
	NSMutableArray *result = sut.prop2;
	XCTAssert(![result isKindOfClass:[NSMutableArray class]]);
	XCTAssert([result isKindOfClass:[NSArray class]]);
}

// ivar also does not return NSMutableArray but NSArray
- (void)testProp2_4 {
	
	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableArray *testObj = [@[@"test"] mutableCopy];
	sut.prop2 = testObj;
	NSMutableArray *result = [sut customGetterForProp2];
	XCTAssert(![result isKindOfClass:[NSMutableArray class]]);
	XCTAssert([result isKindOfClass:[NSArray class]]);
}

// mutating the readonly property
- (void)testProp3_1 {

	PropertyContainer *sut = [[PropertyContainer alloc] init];
	NSMutableArray *testObj = [@[@"test"] mutableCopy];
	[sut customSetterForProp3:testObj];
	NSMutableArray *result = sut.prop3;
	XCTAssert([result isKindOfClass:[NSMutableArray class]]);
	[result addObject:@"test2"];
	NSArray *arr = @[@"test", @"test2"];
	XCTAssert([sut.prop3 isEqual:arr]);
}

@end
