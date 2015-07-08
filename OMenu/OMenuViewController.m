//
//  OMenuViewController.m
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "OMenuViewController.h"
#import "OMenuManager.h"

@interface OMenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UIViewController* ownerVC;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation OMenuViewController {
    BOOL isShowMenu;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self build];

}

#pragma mark - build
- (void)build {
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    
    isShowMenu = NO;

    CGFloat tableViewHeight = [self.itemsArr count] * 44;
    CGFloat originY = self.view.frame.size.height - tableViewHeight - 10 - 50;
    CGFloat originX = self.view.frame.size.width - 10 - 200;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(originX, originY, 200, tableViewHeight) style:UITableViewStylePlain];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    

    self.tableView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"OItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];


    if (self.itemsArr) {
        [self.tableView reloadData];
    }
    UITapGestureRecognizer* backgroundGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedBackgroundView:)];
    backgroundGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:backgroundGestureRecognizer];
}

- (void)tappedBackgroundView :(id)sender {
    [self.owner hideMenuView:YES];
}

#pragma mark - tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return [self.itemsArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    OItemTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    OMenuItem* item = [self.itemsArr objectAtIndex:indexPath.row];
    cell.menuItem = item;
    cell.animationFrame = self.cellAnimationFrame;
    cell.owner = self;
    [cell loadCell];
    return cell;
}


#pragma mark - tableview delegate

- (void)selectedItem :(OMenuItem *)item {
    [self.owner selectedItem:item];
}

- (void)completionCellAnimation:(BOOL)finished {
    self.completionAnimation(finished);
}




@end
