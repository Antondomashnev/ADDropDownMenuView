//
//  ADDropDownMenuView.h
//  ADDropDownMenuDemo
//
//  Created by Anton Domashnev on 16.12.13.
//  Copyright (c) 2013 Anton Domashnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADDropDownMenuView : UIView

@property (nonatomic, strong, readonly) NSMutableArray *itemsViews;

@property (nonatomic, strong) UIColor *separatorColor;

- (instancetype)initAtOrigin:(CGPoint)origin withItemsViews:(NSArray *)itemsViews;

@end
