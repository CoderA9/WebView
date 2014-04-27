//
//  ViewController.m
//  WebViewAction
//
//  Created by ANine on 4/27/14.
//  Copyright (c) 2014 ANine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {

    NSString *_deviceId;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createWebViewIfNeeded];
    [self.view addSubview:_webView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createWebViewIfNeeded {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        _webView.alpha = 1.;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        // 禁止拖动
        [(UIScrollView *)[[_webView subviews] objectAtIndex:0] setBounces:NO];
    }else {
        [_webView removeFromSuperview];
    }
}

- (void)refresh
{
    NSString *_urlString = @"https://www.google.com.hk/";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    
    [self refresh];
    _webView.frame = self.view.bounds;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {


    
	if ( UIWebViewNavigationTypeLinkClicked == navigationType )
	{
		NSLog(@"webView  linkClicked......");
	}
	else if ( UIWebViewNavigationTypeFormSubmitted == navigationType )
	{
		NSLog(@"webView  FormSubmitted......");
	}
	else if ( UIWebViewNavigationTypeBackForward == navigationType )
	{
		NSLog(@"webView  backForward......");
	}
	else if ( UIWebViewNavigationTypeReload == navigationType )
	{
		NSLog(@"webView  type Reload......");
	}
	else if ( UIWebViewNavigationTypeFormResubmitted == navigationType )
	{
		NSLog(@"webView  Resubmitted......");
	}
	else if ( UIWebViewNavigationTypeOther == navigationType )
	{
		NSLog(@"webView  TypeOther......");
	}
    
    return YES;
}
@end
