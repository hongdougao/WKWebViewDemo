//
//  WKWebVC.m
//  WKWebViewDemo
//
//  Created by yangyue on 16/3/21.
//  Copyright © 2016年 com.yy.www. All rights reserved.
//

#import "WKWebVC.h"
#import <WebKit/WebKit.h>
@interface WKWebVC  ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@end

@implementation WKWebVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
    [conf.userContentController addScriptMessageHandler:self name:@"webViewApp"];
    
    
    WKWebView *webV = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [webV setBackgroundColor:[UIColor yellowColor]];
    webV.navigationDelegate = self;
    webV.UIDelegate = self;
    
    
//    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
     [webV  loadRequest: [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"a" withExtension:@"html"]]] ;
    [self.view addSubview:webV];
}
#pragma mark WKNavigationDelegate
/**这个代理方法表示当客户端收到服务器的响应头，根据response相关信息，可以决定这次跳转是否可以继续进行。
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%s",__FUNCTION__);
    // 允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}
/** //根据webView、navigationAction相关信息决定这次跳转是否可以继续进行,这些信息包含HTTP发送请求，如头部包含User-Agent,Accept
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@"%s",__FUNCTION__);

    // 允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);

}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%s",__FUNCTION__);

}
//页面接收到重定向的指示时
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation;{
    NSLog(@"%s",__FUNCTION__);

}
//页面接收到重定向的失败时
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%s",__FUNCTION__);

}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%s",__FUNCTION__);

}
// 页面加载失败之后调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);

}


/*//身份认证 与https的双向认证
 completionHandler是必须调用的 
 disposition必须配置一个参数是NSURLSessionAuthChallengeDisposition类型的
 当disposition 是一个NSURLSessionAuthChallengeUseCredential ，类型里必须是有证书或者是美誉证书继续执行
 
 */
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *__nullable credential))completionHandler{
    NSLog(@"%s",__FUNCTION__);
    completionHandler(NSURLSessionAuthChallengePerformDefaultHandling,nil);

}
//当网络内容处理程序终止时
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    NSLog(@"%s",__FUNCTION__);
}
#pragma mark---WKUIDelegate
/*! @abstract 创建一个新的webview
 @param webView 代理调用的webview
 @param configuration 用来创建新的webview的配置
 @param navigationAction 新的webview创建引发的导航动作
 @param windowFeatures 网页请求的窗口特征
 @result A new web view or nil.返回一个web页或者nil
 @discussion 网页返回必须是被特殊的配置创建的。webkit将会在返回的webview里加载请求
 
 如果你没有调用这个方法，webview 将会取消这个导航
 */
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    NSLog(@"%s",__FUNCTION__);

    return nil;
}
/*! @abstract 提醒你的app DOM窗口对象的close（）方法调用成功  
 @param 代理调用的webview webView The web view invoking the delegate method.
 @discussion  你的app应该从删除视图层次和更新的网络视图
被需要的UI 例如关闭内置浏览器的tab或者窗口
 */
- (void)webViewDidClose:(WKWebView *)webView {
    NSLog(@"%s",__FUNCTION__);

}
/*! @abstract 展示js提示板
 
 @param frame js发布的方法 关于信息的框架
 @param completionHandler 回调在命令版消失的时候被调用 
 @discussion 为了用户的安全，你的app应该注意的事实---一个特殊的网站控制整个板块的内容，框架，请求，url，host是一个简单的控制网页的公式 ，面板应该至少有一个ok按钮
 
 如果你调用了这个方法，网页应该表现为用户选择OK按钮
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"%s",__FUNCTION__);
    UIAlertView *alert =   [[UIAlertView alloc]initWithTitle:webView.title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    completionHandler();

}
/*! @abstract 展示一个js控制板
 @param frameframe js发布的方法 关于信息的框架  
 @param completionHandler 在确定控制板消失之后的回调 如果用户选择同一则按YES，用户选择取消则就选择NO
 @discussion 从用户安全来讲，你的app应该注意 在这个控制板上特殊的网站控制内容。一个识别网站控制的标示的简单的公式是frame，request，url，host 
 一个控制板应该有两个btn 一个yes 一个取消
 如果你不调用了这个方法，程序当做用户选择取消btn
 If you do not implement this method, the web view will behave as if the user selected the Cancel button.
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    NSLog(@"%s",__FUNCTION__);

}
/*! @abstract  展示text输入控制器
  @param defaultText 文本输入字段中显示的初始文本  
 @param frame js调用的frame的信息
 @param completionHandler 在调用文字板消失之后的回调 如果用户选择ok 输入记录的文本，否则输入nil
 @discussion  For user security, your app should call attention to the fact
 that a specific website controls the content in this panel. A simple forumla
 for identifying the controlling website is frame.request.URL.host.
 The panel should have two buttons, such as OK and Cancel, and a field in
 which to enter text.
 如果你不调用了这个方法，程序当做用户选择取消按钮

 If you do not implement this method, the web view will behave as if the user selected the Cancel button.
 */
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    NSLog(@"%s",__FUNCTION__);

}
/*! @abstract Invoked when a script message is received from a webpage.
 @param userContentController The user content controller invoking the
 delegate method.
 @param message The script message received.
 */
#pragma mark--WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"%s",__FUNCTION__);

}

@end
