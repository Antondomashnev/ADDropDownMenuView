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

@interface ViewController ()

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
    
    ADDropDownMenuItemView *item1 = [[ADDropDownMenuItemView alloc] initWithSize: CGSizeMake(320, 44)];
    item1.titleLabel.text = NSLocalizedString(@"Item 1", @"");
    
    ADDropDownMenuItemView *item2 = [[ADDropDownMenuItemView alloc] initWithSize: CGSizeMake(320, 64)];
    item1.titleLabel.text = NSLocalizedString(@"Item 2", @"");
    
    ADDropDownMenuItemView *item3 = [[ADDropDownMenuItemView alloc] initWithSize: CGSizeMake(320, 44)];
    item1.titleLabel.text = NSLocalizedString(@"Item 3", @"");
    
    ADDropDownMenuView *dropDownMenuView = [[ADDropDownMenuView alloc] initAtOrigin:CGPointMake(0, 20) withItemsViews:@[item1, item2, item3]];
    [self.view addSubview: dropDownMenuView];
}

@end
