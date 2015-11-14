//
//  SectionsViewModel.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface SectionsViewModel : BaseViewModel
//存放模型
@property (nonatomic, strong) NSMutableArray *sectionArr;

/** 图片 */
- (NSURL *)imageURLForRow:(NSInteger)row;
/** 分区名字 */
- (NSString *)sectionNameForRow:(NSInteger)row;
/** 分区描述 */
- (NSString *)descSectionForRow:(NSInteger)row;
/** 该分区的ID, 传给下一页 */
- (NSNumber *)IdForRow:(NSInteger)row;

- (void)refreshDataCompletionHandle:(void(^)(NSError *error))complete;



@end
















