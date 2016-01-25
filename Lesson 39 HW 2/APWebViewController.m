//
//  APWebViewController.m
//  Lesson 39 HW 2
//
//  Created by Alex on 25.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APWebViewController.h"

@implementation APWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.activityIndicator startAnimating]; // start of animating bar
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.activityIndicator stopAnimating]; // stop of animating bar
    [self refreshButtons];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [self.activityIndicator stopAnimating];
    [self refreshButtons];
    
    if([error code] != NSURLErrorCancelled) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }
    
    NSLog(@"%@", [error localizedDescription]);
    
}


- (void) refreshButtons {
    self.rewindButton.enabled = [self.webView canGoBack];
    self.forwardButton.enabled = [self.webView canGoForward];
    
}

#pragma mark - Actions

- (IBAction)actionRewind:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView  stopLoading];
        [self.webView  goBack];
    }
}

- (IBAction)actionForward:(id)sender {
    
    if ([self.webView  canGoForward]) {
        [self.webView  stopLoading];
        [self.webView  goForward];
    }
}

- (IBAction)actionRefresh:(id)sender {
    [self.webView  stopLoading];
    [self.webView  reload];
}

@end


