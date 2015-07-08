//
//  MainViewController.m
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "MainViewController.h"
#import "OMenuManager.h"

@interface MainViewController () <OMenuViewDelegate,OMenuViewDataSource>

@end

@implementation MainViewController {
    OMenuManager* manager;
    NSArray* itemsArr;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    itemsArr = [NSArray arrayWithObjects:@"Main",@"Profile",@"Dicovery",@"About",@"Feedback",@"About",@"Info", nil];
    manager = [[OMenuManager alloc] init];
    manager.delegate = self;
    manager.dataSource = self; // u dont wantto use datasource OR use itemNameArr
//    manager.itemNameArr = itemsArr;
    [manager addMenuButton:self.btnMenu animation:YES];
    
    
    self.btnMenu.layer.cornerRadius = self.btnMenu.frame.size.height/2;
    self.btnMenu.backgroundColor = [UIColor colorWithRed:236/255.0 green:73/255.0 blue:65/255.0 alpha:1];
    self.btnMenu.layer.shadowColor = [UIColor blackColor].CGColor;
    self.btnMenu.layer.shadowOpacity = 0.5;
    self.btnMenu.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    
    [self.lblMenuName setText:@"Item Name"];
}



#pragma mark - menu delegate
- (void)menuVC:(OMenuViewController *)menuVC didSelectItem:(OMenuItem *)item {
    [self.lblMenuName setText:item.name];
}
- (void)menuVC:(OMenuViewController *)menuVC pressedMenuBtn:(UIButton *)btnMenu {
    
}

- (void)menuVC:(OMenuViewController *)menuVC viewDidHide:(BOOL)isHide {
    
}
#pragma mark - menu datasource
- (NSInteger)numberOfRowInMenuItems {
    return [itemsArr count];
}

- (OMenuItem *)menuManager:(OMenuManager *)manager menuItemForRow:(NSInteger)row {
    OMenuItem* item = [[OMenuItem alloc] init];
    item.name = [itemsArr objectAtIndex:row];
    [item defaultDesign];
    return item;
}


@end
