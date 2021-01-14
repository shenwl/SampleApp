//
//  GTListItem.m
//  SampleApp
//
//  Created by shenwl on 2021/1/7.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding

-(nullable instancetype) initWithCoder: (NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.picUrl = [aDecoder decodeObjectForKey:@"thumbnail_pic_s"];
        self.uniquekey = [aDecoder decodeObjectForKey:@"uniquekey"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.authorName = [aDecoder decodeObjectForKey:@"author_name"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL) supportsSecureCoding {
    return YES;
}

#pragma mark - public method

-(void) configWithDictionary: (NSDictionary *) dictnary {
#warning 类型是否匹配
    self.category = [dictnary objectForKey:@"category"];
    self.picUrl = [dictnary objectForKey:@"thumbnail_pic_s"];
    self.uniquekey = [dictnary objectForKey:@"uniquekey"];
    self.title = [dictnary objectForKey:@"title"];
    self.date = [dictnary objectForKey:@"date"];
    self.authorName = [dictnary objectForKey:@"author_name"];
    self.articleUrl = [dictnary objectForKey:@"url"];
}

@end

