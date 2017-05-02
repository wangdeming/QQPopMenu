//
//  DMTableViewDataSource.h
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class PopMenuModel,TableViewCell;

typedef void(^TableViewCellConfigureBlock)(TableViewCell *cell,PopMenuModel *model);

@interface DMTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype) initWithItems:(NSArray *)anItems
                     cellClass:(Class)cellClass
            configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

@end
