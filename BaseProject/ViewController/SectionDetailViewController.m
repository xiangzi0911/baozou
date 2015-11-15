//
//  SectionDetailViewController.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SectionDetailViewController.h"
#import "SectionDetailViewModel.h"
#import "HotListCell.h"
#import "DetailViewController.h"

@interface SectionDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SectionDetailViewModel *sdVM;
@end

@implementation SectionDetailViewController

- (NSNumber *)Id{
    if (_Id==nil) {
        _Id = [NSNumber new];
    }
    return _Id;
}
- (NSString *)sectionName {
    if(_sectionName == nil) {
        _sectionName = [[NSString alloc] init];
    }
    return _sectionName;
}
- (SectionDetailViewModel *)sdVM{
    if (_sdVM == nil) {
        _sdVM = [SectionDetailViewModel new];
    }
    return _sdVM;
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
    self.title = self.sectionName;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.sdVM getDataWithId:self.Id FromNetCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
        }];
    }];
    [_tableView.header beginRefreshing];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sdVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell" ];
    [cell.imv setImageWithURL:[self.sdVM imageURLStringForRow:indexPath.section]];
    cell.titleLb.text    = [self.sdVM titleForRow:indexPath.section];
    cell.sectionLb.text  = [self.sdVM sectionNameForRow:indexPath.section];
    cell.hitcountLb.text = [self.sdVM hitForRow:indexPath.section];
    
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
    dvc.url = [self.sdVM shareURLForRow:indexPath.section];
    [self.navigationController pushViewController:dvc animated:YES];
}










@end
















