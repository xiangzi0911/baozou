//
//  NewsModel.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"articles":[NewsDetailModel class],@"top_stories":[NewsDetailModel class],@"marketings":[NewsMarketingsModel class]};
}

@end
@implementation NewsDetailModel

@end
@implementation NewsMarketingsModel

@end
@implementation NewsHotModel

+ (NSDictionary *)objectClassInArray{
    return @{@"recent":[NewsHotDetailModel class]};
}

@end

@implementation NewsHotDetailModel

@end

@implementation NewsSectionsModel
+ (NSDictionary *)objectClassInArray{
    return @{@"data":[NewsSectionsDataModel class]};
}
@end
@implementation NewsSectionsDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Id": @"id",@"desc":@"description"};
}
@end

@implementation NewsSectionsDetailModel

+ (NSDictionary *)objectClassInArray{
    return @{@"articles":[NewsHotDetailModel class]};
}

@end

























