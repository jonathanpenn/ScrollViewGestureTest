#import <UIKit/UIKit.h>

@interface RCWGraphView : UIView

@property (nonatomic) CGRect theRedRect;

- (void)moveRectToPoint:(CGPoint)point;
- (BOOL)hitDetectedAtPoint:(CGPoint)point;

@end
