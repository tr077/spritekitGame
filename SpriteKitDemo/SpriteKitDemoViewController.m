#import "SpriteKitDemoViewController.h"
#import "WelcomeScene.h"

@implementation SpriteKitDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    WelcomeScene *welcome = [[WelcomeScene alloc]
                initWithSize:CGSizeMake(skView.bounds.size.width,
                skView.bounds.size.height)];

    [skView presentScene:welcome];

}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}


@end
