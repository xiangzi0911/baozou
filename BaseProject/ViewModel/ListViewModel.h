//
//  ListViewModel.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "BaoZouListNetManager.h"

@interface ListViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSMutableArray *topStories;

@property (nonatomic, strong) NSMutableArray *ImageURL;

@property (nonatomic, assign) NSInteger rowNumber;

- (NSString *)imageURLStringForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)sectionNameForRow:(NSInteger)row;
- (NSString *)hitForRow:(NSInteger)row;
/** 第二页的链接 */
- (NSURL *)shareURLForRow:(NSInteger)row;
//刷新
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
//加载更多
- (void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;
/** 顶部图片的URL */
- (NSURL *)topImageURl:(NSInteger)row;
/** 顶部标签文字 */
- (NSString *)headerStringForRow:(NSInteger)row;
/** 顶部跳转URL */
- (NSURL *)topWebURLForRow:(NSInteger)row;

@end
