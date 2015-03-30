//
//  ProjectWindowController.m
//  DocumentSandbox
//
//  Created by Charles Chamblee on 3/26/15.
//

#import "ProjectWindowController.h"
#import "Document.h"

@interface ProjectWindowController ()

@property (nonatomic, weak) IBOutlet NSTextField *textField;

@property (nonatomic, weak, readonly) TestData *testData;

@end

@implementation ProjectWindowController

#pragma mark - Properties

- (TestData *)testData
{
    Document *document = self.document;
    
    return document.testData;
}

#pragma mark - Init / Dealloc

- (instancetype)init
{
    self = [super initWithWindowNibName:@"ProjectWindowController"];
    
    if (self)
    {
        
    }
    
    return self;
}

#pragma mark - Window Lifecycle

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.textField.stringValue = self.testData.stringValue;
    
    // simulate delay created when window must load a lot of UI
    sleep(1.0f);
}

- (IBAction)saveData:(id)sender
{
    self.testData.stringValue = self.textField.stringValue;
}

#pragma mark - Window Notifications

- (void)windowDidExitVersionBrowser:(NSNotification *)notification
{
    NSLog(@"exited document browser, window count - %lu", [NSApp windows].count);
}

@end
