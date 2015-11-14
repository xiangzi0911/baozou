//
//  SectionCell.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SectionCell.h"

@implementation SectionCell

- (UIImageView *)imv{
    if (_imv) {
        _imv = [UIImageView new];
        [self.contentView addSubview:_imv];
        [_imv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120, 80));
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
            make.bottom.mas_equalTo(-12);
        }];
    }
    return _imv;
}
- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [UILabel new];
        _nameLb.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(self.imv.mas_right).mas_equalTo(12);
            make.right.mas_equalTo(-12);
        }];
    }
    return _nameLb;
}

- (UILabel *)descLb{
    if (_descLb == nil) {
        _descLb = [UILabel new];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(8);
            make.left.mas_equalTo(self.imv.mas_right).mas_equalTo(12);
            make.right.mas_equalTo(-12);
        }];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor darkGrayColor];
        _descLb.numberOfLines = 2;
    }
    return _descLb;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
