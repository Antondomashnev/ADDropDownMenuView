//
//  ViewController.m
//  ADDropDownMenuDemo
//
//  Created by Anton Domashnev on 16.12.13.
//  Copyright (c) 2013 Anton Domashnev. All rights reserved.
//

#import "ViewController.h"

#import "ADDropDownMenuView.h"
#import "ADDropDownMenuItemView.h"

@interface ViewController ()<ADDropDownMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addDropDownMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)addDropDownMenu{
    
    ADDropDownMenuView *dropDownMenuView = [[ADDropDownMenuView alloc] initAtOrigin:CGPointMake(0, 20)
                                                            withItemsViews:@[[self dropDownItemWithTitle:NSLocalizedString(@"Item 1", @"")],
                                                                             [self dropDownItemWithTitle:NSLocalizedString(@"Item 2", @"")],
                                                                             [self dropDownItemWithTitle:NSLocalizedString(@"Item 3", @"")]]];
    dropDownMenuView.delegate = self;
    dropDownMenuView.separatorColor = [UIColor blackColor];
    [self.view addSubview: dropDownMenuView];
}

- (ADDropDownMenuItemView *)dropDownItemWithTitle:(NSString *)title{
    
    ADDropDownMenuItemView *item = [[ADDropDownMenuItemView alloc] initWithSize: CGSizeMake(320, 44)];
    item.titleLabel.text = title;
    [item setTitleColor:[UIColor colorWithRed:161./255. green:163./255. blue:163./255. alpha:1.] forState:ADDropDownMenuItemViewStateNormal];
    return item;
}

#pragma mark - ADDropDownMenuDelegate

- (void)ADDropDownMenu:(ADDropDownMenuView *)view didSelectItem:(ADDropDownMenuItemView *)item{
    NSLog(@"%@ selected", item.titleLabel.text);
}

@end
