//
//  GTListItem.m
//  SampleApp
//
//  Created by shenwl on 2021/1/7.
//

#import "GTListItem.h"

@implementation GTListItem

-(void) configWithDictionary: (NSDictionary *) dictnary {
#warning 类型是否匹配
    self.category = [dictnary objectForKey:@"category"];
    self.picUrl = [dictnary objectForKey:@"thunmnail_pic_s"];
    self.uniquekey = [dictnary objectForKey:@"uniquekey"];
    self.title = [dictnary objectForKey:@"title"];
    self.date = [dictnary objectForKey:@"date"];
    self.authorName = [dictnary objectForKey:@"author_name"];
    self.articleUrl = [dictnary objectForKey:@"url"];
}

@end

