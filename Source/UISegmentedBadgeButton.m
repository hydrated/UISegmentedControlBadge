//
//  UISegmentedBadgeButton.m
//  FG
//
//  Created by hydra on 2015/11/5.
//  Copyright © 2015年 FG. All rights reserved.
//

#import "UISegmentedBadgeButton.h"

@implementation UISegmentedBadgeButton

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
    if(self) {
        self.msgNotifybg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_tab_notif_bg"]];
        _msgNotifybg.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_msgNotifybg];
        
        self.msgNum = [[UILabel alloc] init];
        _msgNum.textAlignment = NSTextAlignmentCenter;
        [_msgNum setTextColor:[UIColor whiteColor]];
        _msgNum.font = [UIFont systemFontOfSize:13.0f];
        _msgNum.translatesAutoresizingMaskIntoConstraints = NO;
        [_msgNotifybg addSubview:_msgNum];
        
        [self updateConstraintsIfNeeded];
    }
    return self;
}


-(void)updateConstraints
{
    
    
    [super updateConstraints];
    NSDictionary *layoutDict = NSDictionaryOfVariableBindings(_msgNotifybg, _msgNum);
    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_homeBtn][_topicBtn(==_homeBtn)][_searchBtn(==_homeBtn)][_memberBtn(==_homeBtn)][_moreBtn(==_homeBtn)]|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:layoutDict]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_homeBtn]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:layoutDict]];
//
//    [_memberBtn addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[_msgNotifybg(20)]" options:0 metrics:nil views:layoutDict]];
//    [_memberBtn addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_msgNotifybg(20)]" options:0 metrics:nil views:layoutDict]];
    
    NSLayoutConstraint* cn;
    
    cn = [NSLayoutConstraint constraintWithItem:_msgNotifybg
                                      attribute:NSLayoutAttributeTrailing
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeTrailing
                                     multiplier:1
                                       constant:-5];
    [self addConstraint:cn];
    cn = [NSLayoutConstraint constraintWithItem:_msgNotifybg
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0];
    [self addConstraint:cn];
    
//    cn = [NSLayoutConstraint constraintWithItem:_msgNotifybg
//                                      attribute:NSLayoutAttributeHeight
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:self
//                                      attribute:NSLayoutAttributeHeight
//                                     multiplier:1
//                                       constant:-15];
//    [self addConstraint:cn];
    
    
    
    [_msgNotifybg addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_msgNum]|" options:0 metrics:nil views:layoutDict]];
    [_msgNotifybg addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_msgNum]|" options:0 metrics:nil views:layoutDict]];
    
    
    _msgNotifybg.layer.cornerRadius = 0;
    _msgNotifybg.clipsToBounds = YES;
    
}


@end
