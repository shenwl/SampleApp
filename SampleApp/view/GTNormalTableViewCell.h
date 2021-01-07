//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by shenwl on 2020/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;


@protocol GTNormalTableViewCellDelegate <NSObject>

/**
 点击删除按钮
 */
- (void)tableViewCell: (UITableViewCell *) tableViewCell clickDeleteButtun: (UIButton *) deleteButton;

@end


@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
