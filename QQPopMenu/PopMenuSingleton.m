//
//  PopMenuSingleton.m
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import "PopMenuSingleton.h"
#import "DMPopMenuView.h"

@interface PopMenuSingleton ()
@property (nonatomic, strong) DMPopMenuView * popMenuView;
@end

@implementation PopMenuSingleton

+ (PopMenuSingleton *) shareManager {
    static PopMenuSingleton *_PopMenuSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _PopMenuSingleton = [[PopMenuSingleton alloc]init];
    });
    return _PopMenuSingleton;
}

- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void (^)(NSInteger))action {
    __weak __typeof(&*self)weakSelf = self;
    if (self.popMenuView != nil) {
        [weakSelf hideMenu];
    }
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    self.popMenuView = [[DMPopMenuView alloc]initWithFrame:window.bounds
                                                 menuWidth:width
                                                     items:item
                                                    action:^(NSInteger index) {
                                                        action(index);
                                                        [weakSelf hideMenu];
                                                    }];
    self.popMenuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [window addSubview:self.popMenuView];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    
}

- (void) hideMenu {
    [UIView animateWithDuration:0.15 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.popMenuView.tableView removeFromSuperview];
        [self.popMenuView removeFromSuperview];
        self.popMenuView.tableView = nil;
        self.popMenuView = nil;
    }];
}

@end
