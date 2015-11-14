//
//  HotViewController.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotViewController.h"
#import "HotViewModel.h"
#import "HotListCell.h"
#import "Factory.h"
#import "DetailViewController.h"

@interface HotViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HotViewModel *hotVM;
@end

@implementation HotViewController
- (HotViewModel *)hotVM{
    if (_hotVM == nil) {
        _hotVM = [HotViewModel new];
    }
    return _hotVM;
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[HotListCell class] forCellReuseIdentifier:@"HotCell"];

    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.title = @"排行榜";
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.hotVM refreshDataCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
        }];
    }];
    [_tableView.header beginRefreshing];
    /**
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
     [btn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateHighlighted];
     btn.frame = CGRectMake(0, 0, 30, 30);
     [btn bk_addEventHandler:^(id sender) {
     [vc.navigationController popViewControllerAnimated:YES];
     } forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
     //使用弹簧控件缩小菜单按钮和边缘距离
     UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
     spaceItem.width = -6;
     vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [self.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.hotVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell" ];
    [cell.imv setImageWithURL:[NSURL URLWithString:[self.hotVM imageURLStringForRow:indexPath.section]]];
    cell.titleLb.text    = [self.hotVM titleForRow:indexPath.section];
    cell.sectionLb.text  = [self.hotVM sectionNameForRow:indexPath.section];
    cell.hitcountLb.text = [self.hotVM hitForRow:indexPath.section];
    
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
//尾部出现个灰色条
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *dvc = [DetailViewController new];
    dvc.url = [self.hotVM shareURLForRow:indexPath.section];
    [self.navigationController pushViewController:dvc animated:YES];
}




@end












