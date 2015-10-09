//
//  AppDelegate.m
//  PDFBinder
//
//  Created by Wunmin on 15/8/3.
//  Copyright (c) 2015年 Wunmin Chung. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)select:(id)sender {
    
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    NSInteger button = [openPanel runModal];
    if (button == NSFileHandlingPanelOKButton) {
        
        
        NSURL *chosenURL = [[openPanel URLs] objectAtIndex:0];
        [fileURL setObjectValue:chosenURL];
        PDFDocument *inputDocument = [[PDFDocument alloc] initWithURL:chosenURL];
        inputDocuments = [[NSMutableArray alloc] initWithObjects:inputDocument, nil];
    }
}

- (IBAction)select1:(id)sender {
    
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    NSInteger button = [openPanel runModal];
    if (button == NSFileHandlingPanelOKButton) {
        
        NSURL *chosenURL = [[openPanel URLs] objectAtIndex:0];
        [fileURL1 setObjectValue:chosenURL];
        PDFDocument *inputDocument1 = [[PDFDocument alloc] initWithURL:chosenURL];
        [inputDocuments addObject:inputDocument1];
    }
}

- (IBAction)merge:(id)sender {

    PDFDocument *outputDocument = [[PDFDocument alloc] init];
    NSUInteger pageIndex = 0;
    for (PDFDocument *inputDocument in inputDocuments) {
        for (NSUInteger j = 0; j < [inputDocument pageCount]; j++) {
            
            PDFPage *page = [inputDocument pageAtIndex:j];
            [outputDocument insertPage:page atIndex:pageIndex++];
        }
    }
    
    __block NSSavePanel *mergePanel = [NSSavePanel savePanel];
    [mergePanel setAllowedFileTypes:[NSArray arrayWithObjects:@"pdf", nil]];
    
    [mergePanel beginSheetModalForWindow:[self window]
                       completionHandler:^(NSInteger result) {
                           if (result == NSOKButton) {
                               
                               NSURL *mergeURL = [mergePanel URL];
                               [outputDocument writeToURL:mergeURL];
                               
                           }
                           mergePanel = nil;
                       }];
        NSLog(@"outputDocument has %lu pages", (unsigned long)[outputDocument pageCount]);
}

@end
