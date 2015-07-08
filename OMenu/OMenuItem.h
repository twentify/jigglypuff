//
//  OMenuItem.h
//  OMenu
//
//  Created by omer on 8.07.2015.
//  Copyright (c) 2015 Twentify. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultFont [UIFont fontWithName:@"Helvetica-Regular" size:15]
#define defaultFontColor [[UIColor blackColor] colorWithAlphaComponent:0.9]
#define defaultBoxViewColor [UIColor colorWithRed:0/255.0 green:160/255.0 blue:135/255.0 alpha:1]

@interface OMenuItem : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* imgName; // default nil
@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) UIColor* boxViewColor;
@property (nonatomic) BOOL hasIsBoxViewShadow;
@property (nonatomic, strong) UIColor* fontColor;
- (void)defaultDesign;
@end
