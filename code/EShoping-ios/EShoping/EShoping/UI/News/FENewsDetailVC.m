//
//  FENewsDetailVC.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FENewsDetailVC.h"
#import "FENews.h"

@interface FENewsDetailVC ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *newsShowWebView;
@property (strong, nonatomic) IBOutlet UILabel *newsTitle;

@end

@implementation FENewsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsTitle.numberOfLines = 0;
    self.newsTitle.text = self.news.title;

    [self.newsShowWebView loadHTMLString:self.news.content baseURL:nil];
    self.newsShowWebView.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '400%'";
//    [webView stringByEvaluatingJavaScriptFromString:str];
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
