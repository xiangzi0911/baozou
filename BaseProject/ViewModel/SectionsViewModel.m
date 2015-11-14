//
//  SectionsViewModel.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SectionsViewModel.h"
#import "NewsModel.h"
#import "BaoZouListNetManager.h"

@implementation SectionsViewModel

- (NSMutableArray *)sectionArr{
    if (_sectionArr==nil) {
        _sectionArr = [NSMutableArray new];
    }
    return _sectionArr;
}


/** 图片 */
- (NSURL *)imageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumbnail];
}
/** 分区名字 */
- (NSString *)sectionNameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
/** 分区描述 */
- (NSString *)descSectionForRow:(NSInteger)row{
    return [self modelForRow:row].desc;
}
/** 该分区的ID, 传给下一页 */
- (NSNumber *)IdForRow:(NSInteger)row{
    return [self modelForRow:row].Id;
}
/** 按行号取模型 */
- (NewsSectionsDataModel *)modelForRow:(NSInteger)row{
    return self.sectionArr[row];
}

- (void)refreshDataCompletionHandle:(void (^)(NSError *))complete{
    [BaoZouListNetManager getSectionsList:^(NewsSectionsModel *model, NSError *error) {
        [self.sectionArr addObjectsFromArray:model.data];
        //self.sectionArr = [model.data mutableCopy];
        complete(error);
    }];
}



@end
























