//
//  SecionListViewController.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SecionListViewController.h"
#import "SectionsViewModel.h"
#import "SectionCell.h"
#import "Factory.h"
#import "SectionDetailViewController.h"


@interface SecionListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SectionsViewModel *sectionVM;

@end

@implementation SecionListViewController

- (SectionsViewModel *)sectionVM{
    if (_sectionVM == nil) {
        _sectionVM = [SectionsViewModel new];
    }
    return _sectionVM;
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
        [_tableView registerClass:[SectionCell class] forCellReuseIdentifier:@"SectionCell"];
        
    }
    return _tableView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.tableView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self.sectionVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableView.header endRefreshing];//此处不能改成self.tableView   不然会提前结束导致空数组
            [_tableView reloadData];
        }];
    }];
    [_tableView.header beginRefreshing];
    self.title = @"栏目";
    [Factory addSideMenuBackItemToVC:self];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionVM.sectionArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SectionCell"];
    cell.imv = [UIImageView new];
    [cell.imv setImageWithURL:[self.sectionVM imageURLForRow:indexPath.section]];
    cell.descLb.text = [self.sectionVM descSectionForRow:indexPath.section];
    cell.nameLb.text = [self.sectionVM sectionNameForRow:indexPath.section];
    
    return cell;
}
//自适应行高
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
//跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SectionDetailViewController *vc = [SectionDetailViewController new];
    vc.Id = [self.sectionVM IdForRow:indexPath.section];
    vc.sectionName = [self.sectionVM sectionNameForRow:indexPath.section];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
















