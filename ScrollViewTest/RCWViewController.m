#import "RCWViewController.h"
#import "RCWGraphView.h"
#import <QuartzCore/QuartzCore.h>

@interface RCWViewController () {
    CGPoint dragOffset;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *myPanGestureRecognizer;
@property (weak, nonatomic) IBOutlet RCWGraphView *graphView;

@end

@implementation RCWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustContentSizeForSomethingToScroll];

    self.myPanGestureRecognizer.delegate = self;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self adjustContentSizeForSomethingToScroll];
}


#pragma mark - Gesture Handling

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.myPanGestureRecognizer) {
        CGPoint point = [gestureRecognizer locationInView:self.graphView];
        return [self.graphView hitDetectedAtPoint:point];
    } else {
        return YES;
    }
}

- (IBAction)myPanGestureRecognized:(UIPanGestureRecognizer *)recognizer {
    CGPoint nowPoint = [recognizer locationInView:self.graphView];

    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint rectOrigin = self.graphView.theRedRect.origin;
        dragOffset = CGPointMake(rectOrigin.x - nowPoint.x, rectOrigin.y - nowPoint.y);
    }

    CGPoint adjustedPoint = CGPointMake(nowPoint.x + dragOffset.x, nowPoint.y + dragOffset.y);
    [self.graphView moveRectToPoint:adjustedPoint];
}


#pragma mark - Setup

- (void)adjustContentSizeForSomethingToScroll {
    // Need to set the content size so there is, in fact, something to scroll.
    CGSize size = CGSizeMake(320,self.view.bounds.size.height*1.2);
    self.graphView.frame = CGRectMake(0, 0, size.width, size.height);
    [self.scrollView setContentSize:size];
}

@end
