//
//  GTLikeViewController.m
//  SampleApp
//
//  Created by shenwl on 2020/12/27.
//

#import "GTLikeViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDeleteCellView.h"

@interface GTLikeViewController () <UITableViewDelegate, UITableViewDataSource, GTNormalTableViewCellDelegate>

@end

@implementation GTLikeViewController

- (instancetype) init {
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"table";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:true];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
    return cell;
}

- (void)tableViewCell: (UITableViewCell *) tableViewCell clickDeleteButtun: (UIButton *) deleteButton {
    GTDeleteCellView *view = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    [view showDeleteView];
}

@end
