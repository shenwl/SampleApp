//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by shenwl on 2020/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell: (UITableViewCell *) tableViewCell clickDeleteButtun: (UIButton *) deleteButton;

@end


@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
