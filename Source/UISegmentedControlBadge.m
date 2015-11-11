//
//  UISegmentedControlBadge.m
//  FG
//
//  Created by hydra on 2015/11/4.
//  Copyright © 2015年 FG. All rights reserved.
//

#import "UISegmentedControlBadge.h"

@interface UISegmentedControlBadge ()
{
    UISegmentedBadgeButton *button1;
    UISegmentedBadgeButton *button2;
    UISegmentedBadgeButton *button3;
    NSArray *myItems ;
}
@end

@implementation UISegmentedControlBadge

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        button1 = [UISegmentedBadgeButton buttonWithType:UIButtonTypeCustom];
        button2 = [UISegmentedBadgeButton buttonWithType:UIButtonTypeCustom];
        button3 = [UISegmentedBadgeButton buttonWithType:UIButtonTypeCustom];
        
        [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setHidden:true];
        [button2 setHidden:true];
        [button3 setHidden:true];
        
        [self addSubview:button1];
        [self addSubview:button2];
        [self addSubview:button3];
    }
    return self;
}

-(instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    if(self) {
        myItems = items;
    }
    return self;
}

-(void)setupButtonBadge:(NSInteger)index number:(uint)number
{
    
    if (index > [self numberOfSegments]-1) {
        return;
    }
    if(index == 0) {
        if(number == 0) {
            [button1 setHidden:true];
            [self setTitle:[myItems objectAtIndex:0] forSegmentAtIndex:0];
        } else {
            [self setTitle:[[myItems objectAtIndex:0] stringByAppendingString:@"　　"] forSegmentAtIndex:0];
            [button1 setHidden:false];
            button1.msgNum.text = [NSString stringWithFormat:@"%d",number<99 ? number : 99];
        }
    }
    if(index == 1) {
        if(number == 0) {
            [button2 setHidden:true];
            [self setTitle:[myItems objectAtIndex:1] forSegmentAtIndex:1];
        } else {
            [self setTitle:[[myItems objectAtIndex:1] stringByAppendingString:@"　　"] forSegmentAtIndex:1];
            [button2 setHidden:false];
            button2.msgNum.text = [NSString stringWithFormat:@"%d",number<99 ? number : 99];
        }
    }
    if(index == 2) {
        if(number == 0) {
            [button3 setHidden:true];
            [self setTitle:[myItems objectAtIndex:2] forSegmentAtIndex:2];
        } else {
            [self setTitle:[[myItems objectAtIndex:2] stringByAppendingString:@"　　"] forSegmentAtIndex:2];
            [button3 setHidden:false];
            button3.msgNum.text = [NSString stringWithFormat:@"%d",number<99 ? number : 99];
        }
    }
    
}



-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if(myItems != nil && [myItems count] > 0) {
        if([myItems count] == 1) {
            [button1 setFrame:CGRectMake(0, 0,frame.size.width,frame.size.height)];
            //[button2 removeFromSuperview];
            //[button3 removeFromSuperview];
        } else if([myItems count] == 2) {
            [button1 setFrame:CGRectMake(0, 0,frame.size.width/2,frame.size.height)];
            [button2 setFrame:CGRectMake(frame.size.width/2, 0,frame.size.width/2,frame.size.height)];
            //[button3 removeFromSuperview];
        } else if([myItems count] == 3) {
            [button1 setFrame:CGRectMake(0, 0,frame.size.width/3,frame.size.height)];
            [button2 setFrame:CGRectMake(frame.size.width/3, 0,frame.size.width/3,frame.size.height)];
            [button3 setFrame:CGRectMake(2*frame.size.width/3, 0,frame.size.width/3,frame.size.height)];
        } else {
            [NSException raise:@"UISegmentedControlBadge exception." format:@"UISegmentedControlBadge only support maximum 3 segments now" ];
        }
    }
}

-(void)buttonClicked:(id)sender
{
    [button1 setHighlighted:false];
    [button2 setHighlighted:false];
    [button3 setHighlighted:false];
    if(sender == button1) {
        [self setSelectedSegmentIndex:0];
    }
    if(sender == button2) {
        [self setSelectedSegmentIndex:1];
    }
    if(sender == button3) {
        [self setSelectedSegmentIndex:2];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}


-(void)layoutSubviews
{
//    [self.badgeView updateConstraints];
//    [super layoutSubviews];
//    for (UIView *view in [self subviews]){
//        
//        for(UILabel *subview in [view subviews]) {
//            
//            if([subview isKindOfClass:[UILabel class]]) {
//                if ([subview.text hasPrefix:@"發表"]) {
//                    CGPoint center = [subview convertPoint:subview.center toView:self];
//                   // CGRect frame = [subview convertRect:subview.bounds toView:self];
//                    //[badgeview setCenter:center];
//                    [self.badgeView setCenter:CGPointMake(subview.frame.size.width+subview.frame.origin.x, subview.center.y)];
//                }
//                  labelCenter = subview.center;
//                //[badgeview setCenter:CGPointMake(subview.frame.size.width+subview.frame.origin.x, subview.center.y)];
//                //[badgeview updateConstraints];
//            }
//        }
//        
//        
////        if([view isKindOfClass:[NotificationView class]]){
////            [view updateConstraints];
////            [self bringSubviewToFront:view];
////        }
//    }
//    
//    CGPoint center = self.center;
//    
//    [self.badgeView setCenter:CGPointMake(self.frame.size.width/3, labelCenter.y)];
//    [self bringSubviewToFront:self.badgeView];
    
    [super layoutSubviews];
//    for (UIView *view in [self subviews]) {
//        if(![view isKindOfClass:[UIButton class]]) {
//            [view removeFromSuperview];
//        }
//    }
    [self bringSubviewToFront:button1];
    [self bringSubviewToFront:button2];
    [self bringSubviewToFront:button3];
}



- (void)dealloc
{
}

@end
