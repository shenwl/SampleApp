//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by shenwl on 2020/12/27.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic, strong, readwrite) UIImageView *rightImageView;

@property(nonatomic, strong, readwrite) UIButton *deleteButton;


@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor grayColor];
            self.rightImageView;
        })];
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 80, 30, 20)];
            self.deleteButton.backgroundColor = [UIColor greenColor];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
    }
    return self;
}

- (void)layoutTableViewCell {
    self.titleLabel.text = @"测试cell标题";
    
    self.sourceLabel.text = @"测试来源";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"1119评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(
                                         self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15,
                                         self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height
                                         );
    
    self.timeLabel.text = @"10分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(
                                         self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15,
                                         self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height
                                         );
}

- (void) deleteButtonClick {
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButtun:)]) {
        [self.delegate tableViewCell:self clickDeleteButtun:self.deleteButton];
    }
}

@end
