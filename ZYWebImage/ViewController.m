//
//  ViewController.m
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+ZYWebCache.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *array;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array = @[@"http://img0.bdstatic.com/img/image/shouye/sheying0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/bizhi0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/mingxing0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/lvyou0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/dongman0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/qiche0304.jpg",
               @"http://img0.bdstatic.com/img/image/shouye/sheji0304.jpg"];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell.imageView zy_setImageWithURL:[NSURL URLWithString:_array[indexPath.row%7]]];
    
    return cell;
}

@end
