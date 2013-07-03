//
//  RCWPanGestureRecognizer.m
//  ScrollViewTest
//
//  Created by Jonathan on 7/2/13.
//  Copyright (c) 2013 Rubber City Wizards. All rights reserved.
//

#import "RCWPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation RCWPanGestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.state = UIGestureRecognizerStateBegan;
}

@end
