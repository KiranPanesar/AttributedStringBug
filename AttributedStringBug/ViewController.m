//
//  ViewController.m
//  AttributedStringBug
//
//  Created by kiran on 25/08/2016.
//  Copyright © 2016 Nativ Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    // Create a label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, self.view.frame.size.width - 40.0f, 30.0f)];
    
    // Create an NSTextAttachment with our image. This WILL NOT be green due to the bug.
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"video_icon"];
    
    // Create a base NSAttributedString starting with the `attachment`
    NSMutableAttributedString *bodyText = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    
    // Append the text that will be coloured green
    [bodyText appendAttributedString:[[NSAttributedString alloc] initWithString:@"This is green"]];
    
    // This attachment will be appended at the end of the string and WILL be green.
    NSTextAttachment *greenAttachment = [[NSTextAttachment alloc] init];
    greenAttachment.image = [UIImage imageNamed:@"video_icon"];
    [bodyText appendAttributedString:[NSAttributedString attributedStringWithAttachment:greenAttachment]];
    
    // Apply a foreground color attribute to the whole string
    [bodyText addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, bodyText.length)];
    
    // Set the attributed text of the label
    label.attributedText = bodyText;
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
