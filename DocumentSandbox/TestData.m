//
//  TestData.m
//  DocumentSandbox
//
//  Created by Charles Chamblee on 3/26/15.
//

#import "TestData.h"

@implementation TestData

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.stringValue = @"I am test data.";
    }
    
    return self;
}

@end
