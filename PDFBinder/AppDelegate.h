//
//  AppDelegate.h
//  PDFBinder
//
//  Created by Wunmin on 15/8/3.
//  Copyright (c) 2015年 Wunmin Chung. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    
    __weak IBOutlet NSTextField *fileURL;
    __weak IBOutlet NSTextField *fileURL1;
    NSMutableArray *inputDocuments;
}


- (IBAction)select:(id)sender;
- (IBAction)select1:(id)sender;
- (IBAction)merge:(id)sender;

@end

