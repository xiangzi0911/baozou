//
//  SectionDetailViewModel.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface SectionDetailViewModel : BaseViewModel


@property (nonatomic, assign) NSInteger rowNumber;
- (NSURL *)imageURLStringForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)sectionNameForRow:(NSInteger)row;
- (NSString *)hitForRow:(NSInteger)row;
/** 用于存放数据 */
@property (nonatomic, strong) NSMutableArray *sectionsData;

/** 第二页的链接 */
- (NSURL *)shareURLForRow:(NSInteger)row;

/** 获取当前分区的数据 */
- (void)getDataWithId:(NSNumber *)Id FromNetCompleteHandle:(void(^)(NSError *error))complete;

@end





















