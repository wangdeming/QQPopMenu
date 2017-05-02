//
//  DMTableViewDelegate.h
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^TableViewDidSelectRowAtIndexPath)(NSInteger indexRow);

@interface DMTableViewDelegate : NSObject<UITableViewDelegate>

-(instancetype)initWithDidSelectRowAtIndexPath:(TableViewDidSelectRowAtIndexPath)tableViewDidSelectRowAtIndexPath;
@end
