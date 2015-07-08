//
//  MainViewController.m
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "MainViewController.h"
#import "OMenuManager.h"

@interface MainViewController () <OMenuViewDelegate>

@end

@implementation MainViewController {
    OMenuManager* manager;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* itemsArr = [NSArray arrayWithObjects:@"Main",@"Profile",@"Dicovery",@"About",@"Feedback",@"About",@"About",@"dd",@"About", nil];
    manager = [[OMenuManager alloc] init];
    manager.delegate = self;
    manager.itemNameArr = itemsArr;
    [manager addMenuButton:self.btnMenu];
    self.btnMenu.layer.cornerRadius = self.btnMenu.frame.size.height/2;
    self.btnMenu.backgroundColor = [UIColor colorWithRed:236/255.0 green:73/255.0 blue:65/255.0 alpha:1];

    self.btnMenu.layer.shadowColor = [UIColor blackColor].CGColor;
    self.btnMenu.layer.shadowOpacity = 0.5;
    self.btnMenu.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    [self.lblMenuName setText:@"Menu Name"];
}



#pragma mark - menu delegate
- (void)menuVC:(OMenuViewController *)menuVC didSelectItem:(OMenuItem *)item {
    [self.lblMenuName setText:item.name];
}

@end
