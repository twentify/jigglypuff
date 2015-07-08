//
//  OMenuManager.m
//  OMenu
//
//  Created by omer on 8.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "OMenuManager.h"

@implementation OMenuManager {
    UIButton* btnMenu;
    BOOL isAnimationActive;
    BOOL isShowMenu;
    NSMutableArray* itemsArr;
    OMenuViewController* menuVC;
    UIViewController* founderVC;
}

#pragma mark - build
- (void)addMenuButton:(UIButton *)btn {
    isAnimationActive = NO;
    btn.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
    isShowMenu = NO;
    [btn addTarget:self action:@selector(tappedMenuBtn:) forControlEvents:UIControlEventTouchUpInside];
    btnMenu = btn;
}

- (void)tappedMenuBtn :(id)sender {
    if (isAnimationActive) {
        return;
    }
    if (isShowMenu) {
        [self hideMenu];
    }else {
        [self showMenu];
    }
}

#pragma mark - menu 

- (void)showMenu {
    if (self.dataSource) {
        [self callDataSource];
    }
    if (self.itemNameArr) {
        [self callDefaultItems];
    }
    
    [self buildMenuVC];
}

- (void)hideMenu {
    
    [UIView animateWithDuration:0.3 animations:^{
        menuVC.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [menuVC.view removeFromSuperview];
        isShowMenu = NO;
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(menuVC:viewDidHide:)]) {
                [self.delegate menuVC:menuVC viewDidHide:YES];
            }
        }
    }];
    

}

- (void)buildMenuVC {
    isAnimationActive = YES;
    if ([self.delegate isKindOfClass:[UIViewController class]]) {
        menuVC = [[OMenuViewController alloc] init];
        menuVC.itemsArr = itemsArr;
        menuVC.owner = self;
        menuVC.cellAnimationFrame = btnMenu.frame;
        founderVC = (UIViewController *)self.delegate;
        [founderVC.view addSubview:menuVC.view];
        [founderVC.view bringSubviewToFront:btnMenu];
        isShowMenu = YES;
        
        menuVC.completionAnimation = ^(BOOL finished){
            isAnimationActive = NO;
        };
    }
}



#pragma mark - manager datasource
- (void)callDataSource {
    if ([self.dataSource respondsToSelector:@selector(numberOfRowInMenuItems)]) {
        NSInteger itemsCount = [self.dataSource numberOfRowInMenuItems];
        itemsArr = [NSMutableArray array];
        
        for (int i = 0; i < itemsCount; i++) {
            if ([self.dataSource respondsToSelector:@selector(menuManager:menuItemForRow:)]) {
                OMenuItem* item = [self.dataSource menuManager:self menuItemForRow:i];
                [itemsArr addObject:item];
            }
        }
    }
}

- (void)callDefaultItems {
    itemsArr = [NSMutableArray array];
    for (NSString* name in self.itemNameArr) {
        OMenuItem* item = [[OMenuItem alloc] init];
        item.name = name;
        [item defaultDesign];
        [itemsArr addObject:item];
    }
}

#pragma mark - manager delegate


- (void)selectedItem:(OMenuItem *)item {
    if (item) {
        [self.delegate menuVC:menuVC didSelectItem:item];
    }else {
        [self hideMenu];
    }
}

- (void)hideMenuView:(BOOL)hidden {
    if (hidden) {
        [self hideMenu];
    }
}





@end
