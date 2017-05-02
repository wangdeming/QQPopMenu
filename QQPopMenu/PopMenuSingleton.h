//
//  PopMenuSingleton.h
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PopMenuSingleton : NSObject

+(PopMenuSingleton *) shareManager;

- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void(^)(NSInteger index))action;

- (void) hideMenu;

@end
