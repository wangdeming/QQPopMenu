//
//  DMPopMenuView.m
//  QQPopMenu
//
//  Created by SDC201 on 16/4/7.
//  Copyright © 2016年 PCEBG. All rights reserved.
//

#import "DMPopMenuView.h"
#import "DMTableViewDelegate.h"
#import "DMTableViewDataSource.h"
#import "PopMenuModel.h"
#import "PopMenuSingleton.h"
#import "TableViewCell.h"

#define WBNUMBER 6

@interface DMPopMenuView ()
@property (nonatomic, strong) DMTableViewDataSource * tableViewDataSource;
@property (nonatomic, strong) DMTableViewDelegate   * tableViewDelegate;
@end

@implementation DMPopMenuView

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame menuWidth:(CGFloat)menuWidth items:(NSArray *)items action:(void (^)(NSInteger))action
{
    if (self = [super initWithFrame:frame]) {
        self.menuWidth = menuWidth;
        self.menuItem = items;
        self.action = [action copy];
        
        self.tableViewDataSource = [[DMTableViewDataSource alloc]initWithItems:items cellClass:[TableViewCell class] configureCellBlock:^(TableViewCell *cell, PopMenuModel *model) {
            TableViewCell * tableViewCell = (TableViewCell *)cell;
            tableViewCell.textLabel.text = model.title;
            tableViewCell.imageView.image = [UIImage imageNamed:model.image];
        }];
        
        self.tableViewDelegate = [[DMTableViewDelegate alloc]initWithDidSelectRowAtIndexPath:^(NSInteger indexRow) {
            if (self.action) {
                self.action(indexRow);
            }
        }];
        
        self.tableView = [[UITableView alloc]initWithFrame:[self menuFrame] style:UITableViewStylePlain];
        self.tableView.dataSource = self.tableViewDataSource;
        self.tableView.delegate = self.tableViewDelegate;
        self.tableView.layer.cornerRadius = 10.0f;
        self.tableView.layer.anchorPoint = CGPointMake(1.0, 0);
        self.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        self.tableView.rowHeight = 40;
        [self addSubview:self.tableView];
        
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}

-(CGRect)menuFrame
{
    CGFloat menuX = [UIScreen mainScreen].bounds.size.width - 130;
    CGFloat menuY = 180 - 20 * WBNUMBER;
    CGFloat width = self.menuWidth;
    CGFloat heigh = 40 * WBNUMBER;
    return (CGRect){menuX,menuY,width,heigh};
    return CGRectMake(menuX, menuY, width, heigh);
}

-(void)drawRect:(CGRect)rect
{
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    CGFloat location = [UIScreen mainScreen].bounds.size.width-55;
    CGContextMoveToPoint(context,
                         location -  10 - 10, 180);//设置起点
    
    CGContextAddLineToPoint(context,
                            location - 2*10 - 10 ,  170);
    
    CGContextAddLineToPoint(context,
                            location - 10 * 3 - 10, 180);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[PopMenuSingleton shareManager]hideMenu];
}

@end
