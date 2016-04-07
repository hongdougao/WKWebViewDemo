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
    
    
    JSContext *context3 = [[JSContext alloc]init];
    context3[@"NSlog"] = ^(){
        NSLog(@"++++++++begin log +++++++++");
        
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal  in args) {
            NSLog(@" jsVal in args:%@",jsVal);
        }
        
        JSValue *this = [JSContext currentThis];
        NSLog(@"this :%@",this);//this :[object GlobalObject] 全局函数
        NSLog(@"---------end log----------");
        
    };
    [context3 evaluateScript:@"NSlog('ider', [7, 21], { hello:'world', js:100 });"];
    
    
    /* (JSValue *)callWithArguments:(NSArray *)arguments;方法可以反过来将参数传进去来调用方法。*/
    
    JSContext *context4 = [[JSContext alloc]init];
    
    [context4 evaluateScript:@"function add( a , b ){ return a + b ;}"];
    
    JSValue *add2 = context4[@"add"];
    NSLog(@"Func :%@",add2);
    
    JSValue *sum2 = [add callWithArguments:@[@(7),@(21)]];
    NSLog(@"SUM2 :%d",[sum2 toInt32]);
    
    JSContext *context5 = [[JSContext alloc]init];
    context5.exceptionHandler = ^(JSContext *con,JSValue *exception){
         NSLog(@"%@", exception);
        con.exception = exception;
    };
    
    [context5 evaluateScript:@"ider.zheng = 21 "];
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
