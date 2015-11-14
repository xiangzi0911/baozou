//
//  LeftViewController.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "HotViewController.h"
#import "ViewController.h"
#import "SecionListViewController.h"

@interface LeftCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imv;
@property (nonatomic, strong) UILabel *lable;
@end
@implementation LeftCell
- (UIImageView *)imv{
    if (_imv==nil) {
        _imv = [[UIImageView alloc]init];
        [self.contentView addSubview:_imv];
        [_imv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(8);
            make.bottom.mas_equalTo(-8);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _imv;
}
- (UILabel *)lable{
    if (_lable == nil) {
        _lable = [UILabel new];
        [self.contentView addSubview:_lable];
        [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.imv.mas_right).mas_equalTo(40);
        }];
    }
    return _lable ;
}

@end


@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) UIView *redView;

@end

@implementation LeftViewController

- (UIView *)redView{
    if (_redView == nil) {
        _redView = [UIView new];
        _redView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_redView];
        [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.tableView.mas_topMargin).mas_equalTo(-10);
        }];
        UIImageView *imv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login.png"]];
        [_redView addSubview:imv];
        [imv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(50);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        UILabel *label = [UILabel new];
        [_redView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imv);
            make.top.mas_equalTo(imv.mas_bottomMargin).mas_equalTo(30);
        }];
        label.text = @"登录";
        label.textColor = [UIColor blueColor];
        
    }
    return _redView;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[LeftCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.redView];
    self.names = @[@"首页",@"排行榜",@"栏目",@"收藏",@"搜索",@"设置",@"夜间模式",@"离线"];
    [self.tableView reloadData];
    
    
}
#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.imv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row+1]];
    cell.lable.text = self.names[indexPath.row];
    return cell;
}
/** 点击事件 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        //ViewController *vc = [ViewController stander];
        [self.sideMenuViewController setContentViewController:kVCFromSb(@"ContentVC", @"Main")];
        [self.sideMenuViewController hideMenuViewController];
    }
    if(indexPath.row==1){
        HotViewController *vc = [HotViewController new];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self.sideMenuViewController setContentViewController:nvc animated:YES];
        [self.sideMenuViewController hideMenuViewController];
    }
    if(indexPath.row==2){
        SecionListViewController *vc = [SecionListViewController new];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self.sideMenuViewController setContentViewController:nvc animated:YES];
        [self.sideMenuViewController hideMenuViewController];

    }
}
kRemoveCellSeparator
//自适应行高
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


@end


























