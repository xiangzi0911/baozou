//
//  HotViewModel.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotViewModel.h"
#import "NewsModel.h"
#import "BaoZouListNetManager.h"

@implementation HotViewModel

- (NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray new];
    }
    return _datas;
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
- (NewsHotDetailModel *)modelForRow:(NSInteger)row{
    return self.datas[row];
}
- (void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    [self.dataArr removeAllObjects];
    [BaoZouListNetManager getHotList:^(NewsHotModel *model, NSError *error) {
        [self.datas  addObjectsFromArray:model.recent];
        self.rowNumber = self.datas.count;
        complete(error);
    }];
}




@end














