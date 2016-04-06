//
//  JSCoreViewController.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/31.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "JSCoreViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface JSCoreViewController ()

@end

@implementation JSCoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JSContext *context = [[JSContext alloc ]init];
    [context evaluateScript:@"var arr = [21, 7, 'iderzheng.com']"];
    JSValue *jsArr = context[@"arr"];
    
    NSLog(@"JS ARRAY :%@, Length:%@",jsArr,jsArr[@"length"]);
    
    
    jsArr[1] = @"blog";
    jsArr[7] = @7;
    NSLog(@"JS ARRAY :%@,LENGTH :%d",jsArr ,[jsArr[@"length"] toInt32]);
    
    
    NSArray *nsArr = [jsArr toArray];
    NSLog(@"NSArray: %@", nsArr);
    
    JSContext *context2  = [[JSContext alloc]init];
    [context2 evaluateScript:@"function add(a,b){return a + b;}"];
    JSValue *add = context2 [@"add"];
    NSLog(@"FUNC :%@",add);
    
    JSValue *sum = [add callWithArguments:@[@(7),@(21)]];
    NSLog(@"Sum :%d",[sum toInt32]);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
