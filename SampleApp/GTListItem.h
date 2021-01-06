//
//  GTListItem.h
//  SampleApp
//
//  Created by shenwl on 2021/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 列表结构化数据
 */
@interface GTListItem : NSObject

@property(nonatomic, copy, readwrite) NSString * category;
@property(nonatomic, copy, readwrite) NSString * picUrl; // thunmnail_pic_s
@property(nonatomic, copy, readwrite) NSString * uniquekey;
@property(nonatomic, copy, readwrite) NSString * title;
@property(nonatomic, copy, readwrite) NSString * date;
@property(nonatomic, copy, readwrite) NSString * authorName; // author_name
@property(nonatomic, copy, readwrite) NSString * articleUrl; // url

-(void) configWithDictionary: (NSDictionary *) dictnary;

@end

NS_ASSUME_NONNULL_END
