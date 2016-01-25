//
//  APWebViewController.h
//  Lesson 39 HW 2
//
//  Created by Alex on 25.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APWebViewController : UIViewController <UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSURL *url;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rewindButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;

- (IBAction)actionRewind:(id)sender;
- (IBAction)actionForward:(id)sender;
- (IBAction)actionRefresh:(id)sender;


@end
