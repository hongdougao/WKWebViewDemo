//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/18.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebView *webV = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [webV setBackgroundColor:[UIColor yellowColor]];
    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:webV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
