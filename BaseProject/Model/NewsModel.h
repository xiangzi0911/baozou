//
//  NewsModel.h
//  BaseProject
//
//  Created by apple-jd40 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsSectionsDataModel;

@interface NewsModel : BaseModel

@property (nonatomic, strong) NSArray *marketings;
@property (nonatomic, strong) NSString *displayDate;
@property (nonatomic, strong) NSArray *top_stories;
@property (nonatomic, assign) BOOL isToday;
@property (nonatomic, strong) NSArray *articles;
@property (nonatomic, strong) NSString *date;

@end
@interface NewsDetailModel : BaseModel

@property (nonatomic, strong)NSString* video_file_url;
@property (nonatomic, strong)NSString* thumbnail;
@property (nonatomic, strong)NSString* hit_count_string;
@property (nonatomic, strong)NSString* display_date;
@property (nonatomic, strong)NSString* title;
@property (nonatomic, strong)NSNumber* vote_count;
@property (nonatomic, strong)NSString* url;
@property (nonatomic, strong)NSString* image;
@property (nonatomic, strong)NSString* guide_image;
@property (nonatomic, strong)NSNumber* hit_count;
@property (nonatomic, strong)NSString* share_image;
@property (nonatomic, strong)NSString* video_image_url;
@property (nonatomic, strong)NSString* section_image;
@property (nonatomic, strong)NSNumber* section_id;
@property (nonatomic, strong)NSString* share_url;
@property (nonatomic, strong)NSString* ga_prefix;
@property (nonatomic, strong)NSString* tag;
@property (nonatomic, strong)NSString* Id;
@property (nonatomic, strong)NSString* author_avatar;
@property (nonatomic, strong)NSString* guide;
@property (nonatomic, strong)NSString* author_name;
@property (nonatomic, strong)NSString* key_words;
@property (nonatomic, strong)NSString* author_summary;
@property (nonatomic, strong)NSString* section_name;

@end

@interface NewsMarketingsModel : BaseModel

@property (nonatomic, strong) NSString *marketingsIdentifier;
@property (nonatomic, strong) NSString *sectionName;
@property (nonatomic, strong) NSString *marketingsDescription;
@property (nonatomic, assign) double sectionEpisode;
@property (nonatomic, strong) NSString *uniqId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *latestArticleId;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *recoverTime;
@property (nonatomic, strong) NSString *publishTime;
@property (nonatomic, strong) NSString *status;


@end

@interface NewsHotModel : BaseModel
@property (nonatomic, strong) NSArray *recent;
@end

@interface NewsHotDetailModel : BaseModel
@property (nonatomic, strong)NSString* video_file_url;
@property (nonatomic, strong)NSString* thumbnail;
@property (nonatomic, strong)NSString* hit_count_string;
@property (nonatomic, strong)NSString* display_date;
@property (nonatomic, strong)NSString* title;
@property (nonatomic, strong)NSString* url;
@property (nonatomic, strong)NSNumber* vote_count;
@property (nonatomic, strong)NSString* image;
@property (nonatomic, strong)NSString* guide_image;
@property (nonatomic, strong)NSNumber* hit_count;
@property (nonatomic, strong)NSString* share_image;
@property (nonatomic, strong)NSString* video_image_url;
@property (nonatomic, strong)NSNumber* section_id;
@property (nonatomic, strong)NSString* tag;
@property (nonatomic, strong)NSString* ga_prefix;
@property (nonatomic, strong)NSString* share_url;
@property (nonatomic, strong)NSNumber* Id;
@property (nonatomic, strong)NSString* guide;
@property (nonatomic, strong)NSString* author_name;
@property (nonatomic, strong)NSString* key_words;
@property (nonatomic, strong)NSString* section_name;

@end

@interface NewsSectionsModel : BaseModel
@property (nonatomic, strong) NSArray *data;
@end

@interface NewsSectionsDataModel : BaseModel
@property (nonatomic, strong)NSString* uniq_id;
@property (nonatomic, strong)NSNumber* Id;
@property (nonatomic, strong)NSString* desc;
@property (nonatomic, strong)NSString* name;
@property (nonatomic, strong)NSString* thumbnail;
@end

@interface NewsSectionsDetailModel : BaseModel

@property (nonatomic, strong) NSArray *articles;
@property (nonatomic, strong) NewsSectionsDataModel *section;
@property (nonatomic, assign) NSInteger timestamp;

@end


























