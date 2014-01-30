#import "WelcomeScene.h"
#import "ArcheryScene.h"

@interface WelcomeScene ()
@property BOOL sceneCreated;
@end

@implementation WelcomeScene

- (void) didMoveToView:(SKView *)view
{
    if (!self.sceneCreated)
    {
        self.backgroundColor = [SKColor blackColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self addChild: [self createWelcomeNode]];
        self.sceneCreated = YES;
    }
}
//säger sig självt.
- (SKLabelNode *) createWelcomeNode
{
    SKLabelNode *welcomeNode = 
         [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];

    welcomeNode.name = @"welcomeNode";
    welcomeNode.text = @"You VS Kvd";
    welcomeNode.fontSize = 44;
    welcomeNode.fontColor = [SKColor whiteColor];

    welcomeNode.position = 
     CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

    return welcomeNode;
}
//om man vidrör skärmen så startas en animation som sendan tar mig vidare till spelet.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKNode *welcomeNode = [self childNodeWithName:@"welcomeNode"];

    if (welcomeNode != nil)
    {
        SKAction *fadeAway = [SKAction fadeOutWithDuration:1.0];

        [welcomeNode runAction:fadeAway completion:^{
            SKScene *archeryScene = 
                [[ArcheryScene alloc]initWithSize:self.size];

            SKTransition *doors = 
                [SKTransition doorwayWithDuration:1.0];

            [self.view presentScene:archeryScene transition:doors];
        }
         ];
    }
}

@end
