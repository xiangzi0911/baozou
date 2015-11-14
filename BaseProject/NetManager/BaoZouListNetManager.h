//
//  BaoZouListNetManager.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsModel.h"
@interface BaoZouListNetManager : BaseNetManager
+ (id)getLatestList:(void(^)(NewsModel *model , NSError *error))complete;
+ (id)getMoreDatePage:(NSInteger)page completionHandle:(void(^)(NewsModel *model , NSError *error))complete;
/** 获取排行榜(hot) */
+ (id)getHotList:(void(^)(NewsHotModel *model , NSError *error))complete;
/** 获取分区列表 */
+ (id)getSectionsList:(void(^)(NewsSectionsModel *model , NSError *error))complete;
/** 通过分区的Id获取分区的信息 */
+ (id)getSectionWithId:(NSNumber *)Id completionHandle:(void(^)(NewsHotDetailModel *model , NSError *error))complete;


@end





















