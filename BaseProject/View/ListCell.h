//
//  ListCell.h
//  BaoZouRiBao
//
//  Created by apple-jd40 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imv;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *sectionLb;
@property (weak, nonatomic) IBOutlet UILabel *hitcountLb;

@end
