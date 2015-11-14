//
//  HotListCell.m
//  BaseProject
//
//  Created by apple-jd40 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotListCell.h"

@implementation HotListCell

- (UIImageView *)imv {
    if(_imv == nil) {
        _imv = [[UIImageView alloc] init];
        [self.contentView addSubview:_imv];
        [_imv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(85, 85));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(20);
        }];
    }
    return _imv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imv.mas_topMargin).mas_equalTo(2);
            make.left.mas_equalTo(self.imv.mas_rightMargin).mas_equalTo(20);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)sectionLb {
    if(_sectionLb == nil) {
        _sectionLb = [[UILabel alloc] init];
        _sectionLb.font = [UIFont systemFontOfSize:15];
        _sectionLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_sectionLb];
        [_sectionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.imv);
            make.left.mas_equalTo(self.imv.mas_rightMargin).mas_equalTo(20);
            make.width.mas_lessThanOrEqualTo(100);
        }];
    }
    return _sectionLb;
}

- (UILabel *)hitcountLb {
    if(_hitcountLb == nil) {
        _hitcountLb = [[UILabel alloc] init];
        _hitcountLb.font = [UIFont systemFontOfSize:15];
        _hitcountLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_hitcountLb];
        [_hitcountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.imv);
            make.left.mas_equalTo(self.sectionLb.mas_rightMargin).mas_equalTo(10);
            make.width.mas_lessThanOrEqualTo(100);
        }];
    }
    return _hitcountLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
