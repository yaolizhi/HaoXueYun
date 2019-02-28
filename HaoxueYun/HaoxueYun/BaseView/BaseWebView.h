//
//  BaseWebView.h
//  daycareParent
//
//  Created by Git on 2017/12/5.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseWebViewDelegate <NSObject>


@optional
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidStartLoad:(UIWebView *)webView;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end




@interface BaseWebView : UIWebView <UIWebViewDelegate>



-(void)resetFrame:(CGRect)frame;

- (instancetype)initWithDelegate:(id)delegate;


@end
