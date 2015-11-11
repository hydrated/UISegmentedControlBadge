//
//  ViewController.m
//  UISegmentedControlBadge
//
//  Created by hydra on 2015/11/10.
//  Copyright © 2015年 hydra. All rights reserved.
//

#import "ViewController.h"
#import "UISegmentedControlBadge.h"

@interface ViewController ()
{
    UISegmentedControlBadge *segmentedControl;
    int count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    count = 0;
    [self initialUISegmentedControlBadge];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialUISegmentedControlBadge
{
    segmentedControl = [[UISegmentedControlBadge alloc] initWithItems:[[NSArray alloc]initWithObjects:@"Tab", @"Fallout", @"Legacy", nil]];
    segmentedControl.frame = CGRectMake(0, 0, 200, 30);
    self.navigationItem.titleView = segmentedControl;
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segmentedHandler:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedHandler:(id)sender
{
    ++count;
    [segmentedControl setupButtonBadge:segmentedControl.selectedSegmentIndex number:count];
}

@end
