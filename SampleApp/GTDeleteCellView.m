//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by shenwl on 2020/12/29.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView()

@property(nonatomic, strong, readwrite) UIView *bgView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTDeleteCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            _bgView = [[UIView alloc] initWithFrame:self.bounds];
            _bgView.backgroundColor = [UIColor blackColor];
            _bgView.alpha = 0.5;
            
            [_bgView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimissDeleteView)];
                tapGesture;
            })];
            
            _bgView;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside ];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showDeleteView {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.5f animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
    }];
}

- (void)dimissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
    [self removeFromSuperview];
}

@end
