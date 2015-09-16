//
//  ViewController.m
//  TextSandBox
//
//  Created by Aaron Liu on 8/10/15.
//  Copyright (c) 2015 Aaron Liu. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.test.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - change size of text field

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *testfield;
    if (range.length == 0) {
        testfield = [NSString stringWithFormat:@"%@%@", textField.text, string];
    } else {
        testfield = [textField.text substringToIndex:textField.text.length - range.length];
    }
    NSUInteger length = [self getLength:testfield];

    NSLog(@"%lu", length);
    NSLog(@"%@", testfield);
    NSLog(@"%lu", range.length);


    if ([testfield length] >= 10)
    {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
       // scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(.3, .3)];
      //  scaleAnimation.springSpeed= @(100.);
        [textField pop_addAnimation:scaleAnimation forKey:@"scalingUp"];

       // [textField setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    }
    else
    {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //scaleAnimation.duration = ;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [textField pop_addAnimation:scaleAnimation forKey:@"scalingUp2"];
    
    }

    return YES;

}

-(NSInteger)getLength:(NSString*)test
{
    

    
    NSInteger length = [test length];
    
    return length;
    
    
}


@end
