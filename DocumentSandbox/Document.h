//
//  Document.h
//  DocumentSandbox
//
//  Created by Charles Chamblee on 3/26/15.
//

#import <Cocoa/Cocoa.h>
#import "TestData.h"

@interface Document : NSDocument

@property (nonatomic, strong, readonly) TestData *testData;

@end
