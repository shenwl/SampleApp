//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by shenwl on 2021/1/7.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()

@property(nonatomic, strong, readwrite) WKWebView *webview;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, strong, readwrite) NSString *url;

@end

@implementation GTDetailViewController

- (instancetype) initWithUrl:(NSString *)url {
    self = [super init];
    if(self) {
        self.url = url;
    }
    return self;
}

- (void) dealloc {
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"finished load");
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    self.progressView.progress = self.webview.estimatedProgress;
}


@end
