//
//  GTListLoader.m
//  SampleApp
//
//  Created by shenwl on 2021/1/1.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];
    NSLog(@"");
}

@end
