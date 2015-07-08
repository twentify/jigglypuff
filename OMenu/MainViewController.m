//
//  MainViewController.m
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "MainViewController.h"
#import "OMenuManager.h"

@interface MainViewController () <OMenuViewDelegate, OMenuViewDelegate>

@end

@implementation MainViewController {
    OMenuManager* manager;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* itemsArr = [NSArray arrayWithObjects:@"Main",@"Profile",@"Dicovery",@"About",@"Feedback", nil];
    manager = [[OMenuManager alloc] init];
    manager.delegate = self;
    manager.itemNameArr = itemsArr;
    [manager addMenuButton:self.btnMenu];
}



#pragma mark - menu delegate
- (void)menuView:(OMenuViewController *)menuVC selectedItem:(NSString *)item {
    
}

@end
