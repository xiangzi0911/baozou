//
//  HotViewModel.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface HotViewModel : BaseViewModel
@property (nonatomic, assign) NSInteger rowNumber;
- (NSString *)imageURLStringForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)sectionNameForRow:(NSInteger)row;
- (NSString *)hitForRow:(NSInteger)row;

@property (nonatomic, strong) NSMutableArray *datas;

/** 第二页的链接 */
- (NSURL *)shareURLForRow:(NSInteger)row;
//刷新
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

@end
