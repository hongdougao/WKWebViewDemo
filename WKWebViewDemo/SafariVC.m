//
//  SafariVC.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/23.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "SafariVC.h"

@implementation SafariVC
-(void)viewDidLoad{

    [super viewDidLoad];
    self.delegate = self;
}
-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller{
    NSLog(@"-----%s-----",__FUNCTION__);
}
-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{
    NSLog(@"-----%s-----",__FUNCTION__);

}
@end
