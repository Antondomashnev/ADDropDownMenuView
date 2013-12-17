//
//  ADDropDownMenuView.m
//  ADDropDownMenuDemo
//
//  Created by Anton Domashnev on 16.12.13.
//  Copyright (c) 2013 Anton Domashnev. All rights reserved.
//

#import "ADDropDownMenuView.h"

#define SEPARATOR_VIEW_HEIGHT 1

@interface ADDropDownMenuView()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong, readwrite) NSMutableArray *itemsViews;
@property (nonatomic, strong) NSMutableArray *separators;

@end

@implementation ADDropDownMenuView

- (instancetype)initAtOrigin:(CGPoint)origin withItemsViews:(NSArray *)itemsViews{
    
    NSAssert(itemsViews.count > 0, @"ADDropDownMenuView should has at least one item view");
    
    if(self = [super initWithFrame: (CGRect){.origin = origin,
                                             .size = CGSizeMake(((ADDropDownMenuView *)[itemsViews firstObject]).frame.size.width,
                                                                [ADDropDownMenuView contractedHeightForItemsViews:itemsViews])}]){
        self.backgroundColor = [UIColor clearColor];
        self.itemsViews = [itemsViews mutableCopy];
        self.separators = [NSMutableArray array];
                                                 
        [self addContainerView];
        [self addItemsViewsAndSeparators];
    }
    
    return self;
}

#pragma mark - Properties

- (void)setSeparatorColor:(UIColor *)separatorColor{
    
    _separatorColor = separatorColor;
    [self.separators enumerateObjectsUsingBlock:^(UIView *separatorView, NSUInteger idx, BOOL *stop) {
        separatorView.backgroundColor = separatorColor;
    }];
}

#pragma mark - UI

- (void)addContainerView{
    
    self.containerView = [[UIView alloc] initWithFrame: ((ADDropDownMenuView *)[self.itemsViews firstObject]).bounds];
    self.containerView.backgroundColor = [UIColor clearColor];
    self.containerView.clipsToBounds = YES;
    [self addSubview: self.containerView];
}

- (void)addItemsViewsAndSeparators{
    
    NSUInteger itemsCount = self.itemsViews.count;
    __block CGFloat itemY = 0;
    
    [self.itemsViews enumerateObjectsUsingBlock:^(ADDropDownMenuView *item, NSUInteger idx, BOOL *stop) {
        
        item.frame = (CGRect){.origin = CGPointMake(item.frame.origin.x, itemY), .size = item.frame.size};
        [self.containerView addSubview: item];
        
        if(idx < itemsCount - 1){
            UIView *separatorView = [self separatorView];
            separatorView.frame = (CGRect){.origin = CGPointMake(separatorView.frame.origin.x, itemY + item.frame.size.height), .size = separatorView.frame.size};
            [self.containerView addSubview: separatorView];
            itemY = separatorView.frame.size.height + separatorView.frame.origin.y;
        }
    }];
}

- (UIView *)separatorView{
    
    UIView *separatorView = [[UIView alloc] initWithFrame: (CGRect){.size = CGSizeMake(self.bounds.size.width, SEPARATOR_VIEW_HEIGHT)}];
    separatorView.backgroundColor = self.separatorColor;
    [self.separators addObject: separatorView];
    return separatorView;
}

#pragma mark - Helpers

+ (CGFloat)contractedHeightForItemsViews:(NSArray *)itemsViews{
    ADDropDownMenuView *item = [itemsViews firstObject];
    return item.frame.size.height;
}

+ (CGFloat)expandedHeightForItemsViews:(NSArray *)itemsViews{
    NSUInteger itemsCount = itemsViews.count;
    ADDropDownMenuView *someItem = [itemsViews firstObject];
    return itemsCount * someItem.frame.size.height + SEPARATOR_VIEW_HEIGHT * MAX(itemsCount - 1, 0);
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
