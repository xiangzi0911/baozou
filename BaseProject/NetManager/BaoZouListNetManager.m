//
//  BaoZouListNetManager.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaoZouListNetManager.h"

@implementation BaoZouListNetManager
+ (id)getLatestList:(void(^)(NewsModel *model , NSError *error))complete{
    return [self GET:@"http://ribao.ibaozou.com/api/v1/articles/latest" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([NewsModel objectWithKeyValues:responseObj],error);
    }];
}
/** 获取排行榜 */
+ (id)getHotList:(void(^)(NewsHotModel *model , NSError *error))complete{
    return [self GET:@"http://daily.ibaozou.com/api/2/articles/hot" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([NewsHotModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getMoreDatePage:(NSInteger)page completionHandle:(void(^)(NewsModel *model , NSError *error))complete{
    NSDate *date = [NSDate date];
    NSTimeInterval nowsec = date.timeIntervalSince1970 + 8.0*60*60;//1970至今的秒数,我们东8区,所以加后面部分
    NSDate *ystday = [NSDate dateWithTimeIntervalSince1970:nowsec - page*24*60*60];//获取到昨天
    NSString *str = [NSString stringWithFormat:@"%@",ystday];//获取到昨天的字符串 yyyy-MM-dd xxxxx
    NSArray *arr = [str componentsSeparatedByString:@" "];//获取到 yyyy-MM-dd
    NSArray *arr2 = [arr[0] componentsSeparatedByString:@"-"];// 获取到三个 yyyy MM dd
    NSString *yString = [NSString stringWithFormat:@"%@%@%@",arr2[0],arr2[1],arr2[2]];
    NSString *path = [NSString stringWithFormat:@"http://ribao.ibaozou.com/api/v1/articles/before/%@",yString];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([NewsModel objectWithKeyValues:responseObj],error);
        //       NSLog(@"idididididid   %@",responseObj);
    }];
}

/** 获取分区列表 */
+ (id)getSectionsList:(void(^)(NewsSectionsModel *model , NSError *error))complete{
    return [self GET:@"http://ribao.ibaozou.com/api/v1/sections" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([NewsSectionsModel objectWithKeyValues:responseObj],error);
    }];
}
/** 通过分区的Id获取分区的信息 */
+ (id)getSectionWithId:(NSNumber *)Id completionHandle:(void(^)(NewsHotDetailModel *model , NSError *error))complete{
    NSString *path = [NSString stringWithFormat:@"http://daily.ibaozou.com/api/2/section/%@",Id];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([NewsHotDetailModel objectWithKeyValues:responseObj] , error);
    }];
}









@end










