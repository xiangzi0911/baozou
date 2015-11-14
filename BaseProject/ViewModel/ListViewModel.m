//
//  ListViewModel.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListViewModel.h"



@implementation ListViewModel

- (NSMutableArray *)topStories{
    if(!_topStories){
        _topStories = [NSMutableArray new];
    }
    return _topStories;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (NSString *)imageURLStringForRow:(NSInteger)row{
    return [self modelForRow:row].thumbnail;
    
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)sectionNameForRow:(NSInteger)row{
    return [self modelForRow:row].section_name;
}
- (NSString *)hitForRow:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:@"| %@",[self modelForRow:row].hit_count_string];
    return str;
}
- (NSURL *)shareURLForRow:(NSInteger)row{
    NSURL *url = [NSURL URLWithString:[self modelForRow:row].share_url];
    return url;
}
/** 根据行号来获得模型 */
- (NewsDetailModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 顶部图片地址 */
- (NSURL *)topImageURl:(NSInteger)row{
    NewsDetailModel *dtModel = self.topStories[row];
    return [NSURL URLWithString:dtModel.image];
}
/** 顶部标签文字 */
- (NSString *)headerStringForRow:(NSInteger)row{
    NewsDetailModel *dtModel = self.topStories[row];
    return dtModel.title;
}
/** 顶部跳转URL */
- (NSURL *)topWebURLForRow:(NSInteger)row{
    NewsDetailModel *dtModel = self.topStories[row];
    return [NSURL URLWithString:dtModel.share_url];
}

//刷新
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete{
    [self.dataArr removeAllObjects];
    //今天数据
    [BaoZouListNetManager getLatestList:^(NewsModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.articles];
         self.topStories = [model.top_stories mutableCopy];
        
        complete(error);
        //昨天的数据
        [BaoZouListNetManager getMoreDatePage:0 completionHandle:^(NewsModel *model, NSError *error) {
            [self.dataArr addObjectsFromArray:model.articles];
            complete(error);
        }];
        _page = 1;
    }];
    //    //昨天的数据
    //    [BaoZouListNetManager getMoreDatePage:0 completionHandle:^(NewsModel *model, NSError *error) {
    //        [self.dataArr addObjectsFromArray:model.articles];
    //        complete(error);
    //    }];
    
    
}
//加载更多
- (void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete{
    [BaoZouListNetManager getMoreDatePage:_page completionHandle:^(NewsModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.articles];
        complete(error);
    }];
    _page += 1;
}



@end
