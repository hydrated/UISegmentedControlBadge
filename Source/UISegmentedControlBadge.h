//
//  UISegmentedControlBadge.h
//  FG
//
//  Created by hydra on 2015/11/4.
//  Copyright © 2015年 FG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISegmentedBadgeButton.h"

@interface UISegmentedControlBadge : UISegmentedControl

-(void)setupButtonBadge:(NSInteger)index number:(uint)number;

@end
