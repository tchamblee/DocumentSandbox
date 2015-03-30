//
//  AppDelegate.m
//  DocumentSandbox
//
//  Created by Charles Chamblee on 3/26/15.
//

#import "AppDelegate.h"
#import "Document.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    BOOL isFirstRun = NO;
    
    NSURL *testDocumentURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TestDocument" ofType:@"mydoc"]];
    NSURL *tempDocumentURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"TestDocument.mydoc"]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:tempDocumentURL.path])
    {
        isFirstRun = YES;
        [[NSFileManager defaultManager] copyItemAtURL:testDocumentURL toURL:tempDocumentURL error:nil];
    }
    
    [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:tempDocumentURL display:YES completionHandler:^(NSDocument *document, BOOL documentWasAlreadyOpen, NSError *error) {
        
        if (isFirstRun)
        {
            Document *myDocument = (Document *)document;
            
            for (NSInteger x = 0; x < 30; x++)
            {
                NSLog(@"creating document version %lu", x);
                
                myDocument.testData.stringValue = [NSString stringWithFormat:@"%lu", x];
                [myDocument saveDocument:self];
            }
        }
    }];
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
    return NO;
}

@end
