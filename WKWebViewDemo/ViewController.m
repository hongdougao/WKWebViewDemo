//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/18.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)btnPush:(id)sender {
    [self performSegueWithIdentifier:@"wkWebVC" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
