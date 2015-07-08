//
//  OMenuItem.m
//  OMenu
//
//  Created by omer on 8.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import "OMenuItem.h"

@implementation OMenuItem
- (void)defaultDesign {
    if (self) {
        self.font = defaultFont;
        self.fontColor = defaultFontColor;
        self.boxViewColor = defaultBoxViewColor;
        self.hasIsBoxViewShadow = YES;
        
    }
}
@end
