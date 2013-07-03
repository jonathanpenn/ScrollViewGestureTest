#import "RCWGraphView.h"
#import <QuartzCore/QuartzCore.h>

@interface RCWGraphView () {
    CGPoint rectOrigin;
}

@end

@implementation RCWGraphView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1;
    rectOrigin = CGPointMake(50, 50);
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);

    [[UIColor redColor] setFill];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillRect(context, self.theRedRect);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@", NSStringFromCGPoint([[touches anyObject] locationInView:self]));
}

- (void)moveRectToPoint:(CGPoint)point
{
    rectOrigin = point;
    [self setNeedsDisplay];
}

- (BOOL)hitDetectedAtPoint:(CGPoint)point
{
    NSLog(@"%@, rect: %@", NSStringFromCGPoint(point), NSStringFromCGRect([self theRedRect]));
    return CGRectContainsPoint(self.theRedRect, point);
}

- (CGRect)theRedRect
{
    return CGRectMake(rectOrigin.x, rectOrigin.y, rectOrigin.x * 1.4, rectOrigin.y * 0.3);
}

@end
