//
//  OMenuManager.h
//  OMenu
//
//  Created by omer on 8.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMenuViewController.h"

@class OMenuManager;

@protocol OMenuViewDataSource <NSObject>
- (NSInteger)numberOfRowInMenuItems;
- (OMenuItem *)menuManager :(OMenuManager *)manager menuItemForRow :(NSInteger)row;
@end


@protocol OMenuViewDelegate <NSObject>
- (void)menuVC :(OMenuViewController *)menuVC didSelectItem :(OMenuItem *)item;

@optional
- (void)menuVC :(OMenuViewController *)menuVC pressedMenuBtn :(UIButton *)btnMenu;
- (void)menuVC :(OMenuViewController *)menuVC viewDidHide :(BOOL)isHide;
@end


@interface OMenuManager : NSObject

@property (nonatomic, weak) id<OMenuViewDelegate> delegate;
@property (nonatomic, weak) id<OMenuViewDataSource> dataSource;
@property (nonatomic, strong) NSArray* itemNameArr; // u dont want to use OMenuItem

- (void)addMenuButton:(UIButton *)btn animation:(BOOL)animated; // Transform animation
- (void)selectedItem :(OMenuItem *)item;
- (void)hideMenuView :(BOOL)hidden;

@end
