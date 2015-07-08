//
//  OMenuViewController.h
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OItemTableViewCell.h"


@class OMenuManager;
@interface OMenuViewController : UIViewController 

@property (nonatomic, weak)  OMenuManager* owner;
@property (nonatomic, strong) NSArray* itemsArr;
@property (nonatomic) CGRect cellAnimationFrame;
@property (nonatomic, copy) void (^completionAnimation)(BOOL);

- (void)selectedItem :(OMenuItem *)item;
- (void)completionCellAnimation:(BOOL)finished;
@end
