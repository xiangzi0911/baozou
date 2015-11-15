//
//  DetailViewController.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DetailViewController.h"
#import "Factory.h"
@interface DetailViewController ()<UIWebViewDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"---详情---";
    [Factory addBackItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webview = [[UIWebView alloc]init];
    [webview loadRequest:[NSURLRequest requestWithURL:self.url]];
    [self.view addSubview:webview];
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.top.mas_equalTo(-45);
    }];
    webview.delegate = self;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

@end













