//
//  OItemTableViewCell.m
//  OMenu
//
//  Created by omer on 7.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "OItemTableViewCell.h"
#import "OMenuViewController.h"

@implementation OItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lblName.alpha = 0.0f;
    self.viewBox.alpha = 0.0f;
    self.viewBox.layer.cornerRadius = self.viewBox.frame.size.height/2;
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
    self.viewBox.alpha = 0.0f;
    
    UIView* selectedBackground = [[UIView alloc] init];
    selectedBackground.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0f];
    self.selectedBackgroundView = selectedBackground;
}
- (void)uidesign {
    if (self.menuItem.font) {
        self.lblName.font = self.menuItem.font;
    }
    
    if (self.menuItem.fontColor) {
        self.lblName.textColor = self.menuItem.fontColor;
    }
    
    if (self.menuItem.boxViewColor) {
        self.viewBox.backgroundColor = self.menuItem.boxViewColor;
    }
    
    if (self.menuItem.hasIsBoxViewShadow) {
        self.viewBox.layer.shadowColor = [UIColor blackColor].CGColor;
        self.viewBox.layer.shadowOpacity = 0.5;
        self.viewBox.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        
    }
}
- (void)loadCell {
    //self.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    if (self.menuItem) {
        [self uidesign];
        CGRect currentFrame = self.frame;
        CGRect frame = self.animationFrame;
        frame.origin.y = self.animationFrame.size.height + self.animationFrame.origin.y;
        frame.size.height = self.frame.size.height;
        frame.origin.x = self.frame.origin.x;
        self.frame = frame;
        self.viewBox.alpha = 1.0f;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = currentFrame;
            //self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                self.lblName.text = self.menuItem.name;
                self.lblName.alpha = 1.0f;
                [self.owner completionCellAnimation:YES];
            }];
        }];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.owner selectedItem:self.menuItem];
}

@end
