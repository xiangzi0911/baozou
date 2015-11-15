//
//  SectionDetailViewModel.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SectionDetailViewModel.h"
#import "BaoZouListNetManager.h"

@implementation SectionDetailViewModel
- (NSMutableArray *)sectionsData{
    if (_sectionsData == nil) {
        _sectionsData = [NSMutableArray new];
    }
    return _sectionsData;
}

- (NSURL *)imageURLStringForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].image];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)sectionNameForRow:(NSInteger)row{
    return [self modelForRow:row].section_name;
}
- (NSString *)hitForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"| %@",[self modelForRow:row].hit_count_string];
}



/** 第二页的链接 */
- (NSURL *)shareURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].share_url];
}
/** 按行号获取模型 */
- (NewsHotDetailModel *)modelForRow:(NSInteger)row{
    return self.sectionsData[row];
}

/** 获取当前分区的数据 */
- (void)getDataWithId:(NSNumber *)Id FromNetCompleteHandle:(void(^)(NSError *error))complete{
    [BaoZouListNetManager getSectionWithId:Id completionHandle:^(NewsSectionsDetailModel *model, NSError *error) {
        [self.sectionsData addObjectsFromArray:model.articles];
        self.rowNumber = self.sectionsData.count;
        complete(error);
    }];
    
}












@end


















