//
//  DMTableViewDataSource.m
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import "DMTableViewDataSource.h"
#import "TableViewCell.h"

@interface DMTableViewDataSource ()

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) Class Cellclass;
@property (nonatomic, strong) NSArray * modelArray;

@end

@implementation DMTableViewDataSource

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
-(instancetype)initWithItems:(NSArray *)anItems cellClass:(Class)cellClass configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    if (self = [super init]) {
        self.modelArray = anItems;
        self.configureCellBlock = aConfigureCellBlock;
        self.Cellclass = cellClass;
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [[self.Cellclass class]cellAllocWithTableView:tableView];
    self.configureCellBlock(cell,self.modelArray[indexPath.row]);
    return cell;
}

@end
