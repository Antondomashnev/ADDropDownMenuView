//
//  ADDropDownMenuItemView.h
//  ADDropDownMenuDemo
//
//  Created by Anton Domashnev on 16.12.13.
//  Copyright (c) 2013 Anton Domashnev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ADDropDownMenuItemViewState){
    ADDropDownMenuItemViewStateNormal,
    ADDropDownMenuItemViewStateSelected,
    ADDropDownMenuItemViewStateHighlighted
};

@interface ADDropDownMenuItemView : UIView

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, unsafe_unretained, readonly) ADDropDownMenuItemViewState state;

/*!
 @warning ADDropDownMenu works fine with ADDropDownMenuItemView items with the same size
 */
- (instancetype)initWithSize:(CGSize)size;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(ADDropDownMenuItemViewState)state;
- (UIColor *)backgroundColorForState:(ADDropDownMenuItemViewState)state;

@end
