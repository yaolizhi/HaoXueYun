//
//  BaseWebView.m
//  daycareParent
//
//  Created by Git on 2017/12/5.
//  Copyright © 2017年 XueHui. All rights reserved.
//

#import "BaseWebView.h"




@interface BaseWebView  ()


@property (nonatomic,weak) id <BaseWebViewDelegate> webDelegate;
@property (nonatomic,strong) UIProgressView *progressView;


@end





@implementation BaseWebView


- (instancetype)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self)
    {
        [self setDelegate:self];
        [self setWebDelegate:delegate];
        [self addSubview:self.progressView];
        [self setScalesPageToFit:NO];
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.progressView setFrame:CGRectMake(0, 0, frame.size.width, 20.0)];
}



#pragma mark - Delegate Method
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([self.webDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
    {
        [self.webDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.progressView setProgress:0.6];
        
    } completion:^(BOOL finished){}];
    
    
    
    if ([self.webDelegate respondsToSelector:@selector(webViewDidStartLoad:)])
    {
        [self.webDelegate webViewDidStartLoad:webView];
    }
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [self setScalesPageToFitImageWtithWebView:webView];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.progressView setProgress:1.0];
        
    } completion:^(BOOL finished)
     {
         [self performSelector:@selector(progressHidden) withObject:@"隐藏" afterDelay:0.5];
     }];
    
    
    if ([self.webDelegate respondsToSelector:@selector(webViewDidFinishLoad:)])
    {
        [self.webDelegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.progressView setProgress:1.0];
        
    } completion:^(BOOL finished)
     {
         [self performSelector:@selector(progressHidden) withObject:@"隐藏" afterDelay:0.5];
     }];
    
    
    
    if ([self.webDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
    {
        [self.webDelegate webView:webView didFailLoadWithError:error];
    }
}



-(void)progressHidden
{
    [self.progressView setHidden:YES];
}



#pragma mark 让文本自适应图片和文本宽度
/**
 自适应图片和文本宽度

 @param webView UIWebView 对象
 */
-(void)setScalesPageToFitImageWtithWebView:(UIWebView*)webView
{
    NSString *js=@"var script = document.createElement('script');"
    "script.type = 'text/javascript';"
    "script.text = \"function ResizeImages() "
    "{ "
       "var myimg,oldwidth;"
       "var maxwidth = %f;"
       "for(i=0;i <document.images.length;i++)"
       "{"
          "myimg = document.images[i];"
          "if(myimg.width > maxwidth)"
          "{"
             "oldwidth = myimg.width;"
             "myimg.width = %f;"
           "}"
        "}"
    "}\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";

    js=[NSString stringWithFormat:js,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width-15];
    [webView stringByEvaluatingJavaScriptFromString:js];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
}


#pragma mark - Getter /  Setter
-(UIProgressView *)progressView
{
    if (_progressView==nil)
    {
        _progressView=[[UIProgressView alloc] init];
        [_progressView setProgressViewStyle:UIProgressViewStyleBar];
        [_progressView setTintColor:MainColor];
    }
    return _progressView;
}



@end
