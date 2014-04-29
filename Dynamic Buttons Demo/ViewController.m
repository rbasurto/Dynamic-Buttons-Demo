//
//  ViewController.m
//  Dynamic Buttons Demo
//
//  Created by Rene Alejandro Basurto Quijada on 28/04/14.
//  Copyright (c) 2014 Rene A Basurto Q. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFromButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

- (void)setup
{
    NSArray *texts = [NSArray arrayWithObjects: @"Monday", @"December",
                      @"Hello World", @"One", @"Television", @"Walt Disney",
                      @"The Three Musketeers", @"Yes", @"No", @"Click", nil];
    
    CGFloat x = self.view.frame.size.width / 4;
    CGFloat width = self.view.frame.size.width / 2;
    CGFloat height = 20.0;
    
    UIFont *theFont = [self homogeneousFontFor:texts
                                          rect:CGRectMake(0.0, 0.0, width, height)
                                      fontName:[NSString stringWithFormat:@"HelveticaNeue"]];
    
    for (int i = 0; i < [texts count]; i++) {
        CGFloat y = (height + 10) * (i + 1) + 70.0;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button addTarget:self
                   action:@selector(pushButtonDemo:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitle:[texts objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(x, y, width, height);
        button.titleLabel.font = theFont;
        
        [self.view addSubview:button];
    }
}

- (void)pushButtonDemo:(UIButton *)button
{
    NSString *str = [NSString stringWithFormat:@"%@", button.titleLabel.text ];
    self.textFromButton.text = str;
}

- (UIFont *)homogeneousFontFor:(NSArray *)arrayOfTexts
                          rect:(CGRect)rect
                      fontName:(NSString *)fontName
{
    CGFloat minSizeOfFont = 500.0;
    CGFloat tempSize = 12.0;
    CGFloat proportion = 1;
    CGRect tempRect;
    
    for (NSString *text in arrayOfTexts) {
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:fontName size:tempSize]};
        tempRect.size = [text sizeWithAttributes:attributes];
        
        proportion = rect.size.width / tempRect.size.width;
        tempSize *= proportion;
        
        if (tempSize < minSizeOfFont) minSizeOfFont = tempSize;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:fontName size:minSizeOfFont]};
    tempRect.size = [arrayOfTexts[0] sizeWithAttributes:attributes];
    
    if (tempRect.size.height > rect.size.height) {
        proportion = rect.size.height / tempRect.size.height;
        minSizeOfFont *= proportion;
    }
    
    return [UIFont fontWithName:fontName size:minSizeOfFont];
}

@end
