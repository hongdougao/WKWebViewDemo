//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/18.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "ViewController.h"
#import "WKWebVC.h"
#import "SafariVC.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"toSf" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(80, 280, 180, 20)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(openSafari:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)openSafari:(id)sender{

    SafariVC *sf = [[SafariVC alloc]initWithURL:[NSURL URLWithString:@"https://m.baidu.com"]];
//    SafariVC *sf = [[SafariVC alloc]initWithURL:[[NSBundle mainBundle] URLForResource:@"a" withExtension:@"html"]];
    [self presentViewController:sf animated:YES completion:^{
        NSLog(@"presentViewController:sf animated:YES completion");
    }];
//    [self.navigationController pushViewController:sf animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
