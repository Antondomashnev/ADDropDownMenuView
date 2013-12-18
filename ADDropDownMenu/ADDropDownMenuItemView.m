//
//  ADDropDownMenuItemView.m
//  ADDropDownMenuDemo
//
//  Created by Anton Domashnev on 16.12.13.
//  Copyright (c) 2013 Anton Domashnev. All rights reserved.
//

#import "ADDropDownMenuItemView.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define ADTextAlighnmentCenter (([[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending) ? NSTextAlignmentCenter : UITextAlignmentCenter)

@interface ADDropDownMenuItemView()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong) NSMutableDictionary *statesBackgroundColor;

@end

@implementation ADDropDownMenuItemView

- (instancetype)initWithSize:(CGSize)size{
    
    if(self = [super initWithFrame: (CGRect){.size = size}]){
        
        self.statesBackgroundColor = [NSMutableDictionary dictionary];
        
        [self setDefaultValues];
        [self addTitleLabel];
        [self updateUIForCurrentState];
    }
    return self;
}

#pragma mark - Helpers

- (void)setDefaultValues{
    
    [self setBackgroundColor:[UIColor grayColor] forState:ADDropDownMenuItemViewStateNormal];
    [self setBackgroundColor:[UIColor lightGrayColor] forState:ADDropDownMenuItemViewStateSelected];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2] forState:ADDropDownMenuItemViewStateHighlighted];
}

- (void)updateUIForCurrentState{
    
    self.backgroundColor = self.statesBackgroundColor[@(self.state)];
}

#pragma mark - UI

- (void)addTitleLabel{
    
    self.titleLabel = [[UILabel alloc] initWithFrame: self.bounds];
    self.titleLabel.font = [UIFont systemFontOfSize: 16.];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = ADTextAlighnmentCenter;
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self addSubview: self.titleLabel];
}

#pragma mark - Interface

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(ADDropDownMenuItemViewState)state{
    
    NSParameterAssert(backgroundColor);
    self.statesBackgroundColor[@(state)] = backgroundColor;
}

- (UIColor *)backgroundColorForState:(ADDropDownMenuItemViewState)state{
    return self.statesBackgroundColor[@(state)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
