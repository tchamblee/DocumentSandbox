//
//  Document.m
//  DocumentSandbox
//
//  Created by Charles Chamblee on 3/26/15.
//

#import "Document.h"
#import "ProjectWindowController.h"
#import "TestData.h"

@interface Document ()

@property (nonatomic, strong) TestData *testData;

@end

@implementation Document

#pragma mark - Class Method Overrides

+ (BOOL)autosavesInPlace
{
    return YES;
}

// support asynchronous open
+ (BOOL)canConcurrentlyReadDocumentsOfType:(NSString *)typeName
{
    return YES;
}

#pragma mark - Init / Dealloc

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.testData = [TestData new];
    }
    
    return self;
}

#pragma mark - Overrides

// Called whenever we need a new project window - whether for new or open
- (void)makeWindowControllers
{
    ProjectWindowController *projectWindowController = [ProjectWindowController new];
    
    [self addWindowController:projectWindowController];
}

- (BOOL)writeToURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    return [self.testData.stringValue writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (BOOL)readFromURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    self.testData.stringValue = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    return YES;
}

- (IBAction)browseDocumentVersions:(id)sender
{
    NSLog(@"starting document browser, window count - %lu", [NSApp windows].count);
    
    [super browseDocumentVersions:sender];
}

@end
