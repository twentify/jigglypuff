//
//  OItemTableViewCell.h
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMenuItem.h"

@class OMenuViewController;
@interface OItemTableViewCell : UITableViewCell

@property (nonatomic, weak) OMenuViewController* owner;
@property (nonatomic, strong) OMenuItem* menuItem;
@property (nonatomic) CGRect animationFrame;

@property (nonatomic, weak) IBOutlet UILabel* lblName;
@property (nonatomic, weak) IBOutlet UIView* viewBox;

- (void)loadCell;

@end
