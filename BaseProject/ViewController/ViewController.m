

#import "ViewController.h"
#import "ListViewModel.h"
#import "ListCell.h"
#import "iCarousel.h"
#import "DetailViewController.h"
#import "NewsModel.h"
#import "LXImageView.h"
#import "Factory.h"
#define headerViewHeight kWindowW/2

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) iCarousel *ic;
@property (nonatomic, strong) ListViewModel               *ListVM;
@property (weak, nonatomic  ) IBOutlet UITableView        *tableView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation ViewController

{
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

+ (ViewController *)stander{
    static ViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [ViewController new];
    });
    return vc;
}

- (ListViewModel *)ListVM{
    if(_ListVM==nil){
        _ListVM = [ListViewModel new];
    }
    return _ListVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置为红色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];

    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ListVM refreshDataCompleteHandle:^(NSError *error) {
            self.tableView.tableHeaderView = self.headerView;
            [_tableView.header endRefreshing];
            [_tableView reloadData];
        }];
    }];
    [_tableView.header beginRefreshing];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.ListVM getMoreDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
    [Factory addMenuItemToVC:self];
    self.title = @"暴走日报";
    
}

#pragma mark - 实现协议 UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.ListVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCell *cell       = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.imv setImageWithURL:[NSURL URLWithString:[self.ListVM imageURLStringForRow:indexPath.section]]];
    cell.titleLb.text    = [self.ListVM titleForRow:indexPath.section];
    cell.sectionLb.text  = [self.ListVM sectionNameForRow:indexPath.section];
    cell.hitcountLb.text = [self.ListVM hitForRow:indexPath.section];
    //    NSString *str = [self.ListVM hitForRow:indexPath.section];
    return cell;
}
/** 分区高 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.0;
}
/** 点击事件 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [[DetailViewController alloc]init];
    vc.url = [self.ListVM shareURLForRow:indexPath.section];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - iCarousel协议
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.ListVM.topStories.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIImageView *)view{
    if (view==nil) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, headerViewHeight)];
        view.contentMode = 2 ;
        view.clipsToBounds = YES;
    }
    NSURL *url = [self.ListVM topImageURl:index];
    [view setImageWithURL:url];
    
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    DetailViewController *vc = [[DetailViewController alloc]init];
    vc.url = [self.ListVM topWebURLForRow:index];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/** 头部视图 */
-(UIView *)headerView{
    if (_headerView==nil) {
        NSLog(@"dsd");
       // [_timer invalidate];
        //头部视图origin无效,宽度无效,肯定是与table同宽
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, headerViewHeight)];
        _ic = [iCarousel new];
        [_headerView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 0;
        _ic.pagingEnabled = YES;
        _ic.scrollSpeed = 10;
        //开启定时器
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:5 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
        //头部标签
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:19 weight:10];
        [_headerView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(-25);
        }];
        _titleLb.text = [self.ListVM headerStringForRow:0];
        
        
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.ListVM.topStories.count;
        [_headerView addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(10);
            make.centerX.mas_equalTo(0);
        }];
        _pageControl.userInteractionEnabled = NO;//关闭用户交互
    }
    return _headerView;
}
//当前滚动到第几个
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLb.text = [self.ListVM headerStringForRow:_ic.currentItemIndex];
    _pageControl.currentPage = _ic.currentItemIndex;
}


@end




















