ADDropDownMenuView
=============
-------------

ADDropDownMenuView is an iOS navigation drop down style view.

<img src="https://dl.dropboxusercontent.com/u/25847340/ADDropDownMenuView/ADDropDownMenuView.gif" width="320" />

------------
Requirements
============

ADDropDownMenuView works on any iOS version only greater or equal than 5.0 and is compatible with only ARC projects. It depends on the following Apple frameworks:

* Foundation.framework
* UIKit.framework
* CoreGraphics.framework

You will need LLVM 3.0 or later in order to build ADDropDownMenuView. 

------------------------------------
Adding ADGraphView to your project
====================================

From CocoaPods
------------

Add `pod 'ADDropDownMenuView' '~> 1.0.0'` (i hope it will be merged soon =)) to your Podfile.

Source files
------------

There is an old school way to add the ADDropDownMenuView to your project is to directly add the source files from ADDropDownMenu folder in project folder and resources to your project.

-----
Usage
=====

```objective-c
/*
Create a ADDropDownMenuItemView object
*/
ADDropDownMenuItemView *item = [[ADDropDownMenuItemView alloc] initWithSize: CGSizeMake(320, 44)];
/*
Set item title text
*/
item.titleLabel.text = title;

...

ADDropDownMenuView *dropDownMenuView = [[ADDropDownMenuView alloc] initAtOrigin:CGPointMake(0, 20)
                                                            withItemsViews:@[itemsArray]];
dropDownMenuView.delegate = self;
[self.view addSubview: dropDownMenuView];
```

ADDropDownMenuView has ADDropDownMenuItemView separator color options
```objective-c
@property (nonatomic, strong) UIColor *separatorColor;
```

ADDropDownMenuItemView has another methods for customization
```objective-c
/*
You can specify title color for each ADDropDownMenuItemViewState
*/
- (void)setTitleColor:(UIColor *)color forState:(ADDropDownMenuItemViewState)state;

/*
You can set background image for each ADDropDownMenuItemViewState
*/
- (void)setBackgroundImage:(UIImage *)image forState:(ADDropDownMenuItemViewState)state;

/*
Or you can set background color instead image for specific ADDropDownMenuItemViewState
*/
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(ADDropDownMenuItemViewState)state;
```

Also ADDropDownMenuView provide some delegate methods to handle selection and expanding/contracting
```objective-c
- (void)ADDropDownMenu:(ADDropDownMenuView *)view didSelectItem:(ADDropDownMenuItemView *)item;
- (void)ADDropDownMenu:(ADDropDownMenuView *)view willExpandToRect:(CGRect)rect;
- (void)ADDropDownMenu:(id)view willContractToRect:(CGRect)rect;
```

-------
License
=======

This code is distributed under the terms and conditions of the MIT license. 

----------
Change-log
==========

**Version 1.0.0** @ 12.21.13

- Initial release.
