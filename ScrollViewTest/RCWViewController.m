#import "RCWViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RCWViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *myPanGestureRecognizer;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation RCWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpRoundedRects];
    [self adjustContentSizeForSomethingToScroll];

    // Set the pan gesture recognizer itself.
    self.myPanGestureRecognizer.delegate = self;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self adjustContentSizeForSomethingToScroll];
}


#pragma mark - Gesture Handling

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.myPanGestureRecognizer) {
        CGPoint coords = [self.myPanGestureRecognizer locationInView:self.view];
        CGRect frame = [self.scrollView convertRect:self.label.frame toView:self.view];
        return CGRectContainsPoint(frame, coords);
    } else {
        return YES;
    }
}

- (IBAction)myPanGestureRecognized:(UIPanGestureRecognizer *)recognizer {
    CGPoint coords = [recognizer locationInView:self.scrollView];
    self.label.text = [NSString stringWithFormat:@"My Pan: %@", NSStringFromCGPoint(coords)];
    self.label.center = coords;
}


#pragma mark - Setup

- (void)setUpRoundedRects
{
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 15;
}

- (void)adjustContentSizeForSomethingToScroll {
    // Need to set the content size so there is, in fact, something to scroll.
    [self.scrollView setContentSize:CGSizeMake(320,self.view.bounds.size.height*1.2)];
}

@end
