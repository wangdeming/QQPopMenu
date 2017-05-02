  # QQPopMenu

  NSMutableArray *obj = [NSMutableArray array];
  for (NSInteger i = 0; i < [self titles].count; i ++) {
      PopMenuModel *info = [PopMenuModel new];
      info.title = [self titles][i];
      info.image = [self images][i];
      [obj addObject:info];
  }
  [[PopMenuSingleton shareManager]showPopMenuSelecteWithFrame:150 item:obj action:^(NSInteger index) {
      NSLog(@"index:%ld",(long)index);
  }];
  
  - (NSArray *) titles {
    return @[@"扫一扫",
             @"加好友",
             @"创建讨论组",
             @"发送到电脑",
             @"面对面快传",
             @"收钱"];
  }

  - (NSArray *) images {
      return @[@"right_menu_QR@3x",
               @"right_menu_addFri@3x",
               @"right_menu_multichat@3x",
               @"right_menu_sendFile@3x",
               @"right_menu_facetoface@3x",
               @"right_menu_payMoney@3x"];
  }
   

示例图如下：


![](https://github.com/wangdeming/QQPopMenu/blob/master/QQ弹出视图.gif)
