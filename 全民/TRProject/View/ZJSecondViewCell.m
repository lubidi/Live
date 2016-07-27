//
//  ZJSecondViewCell.m
//  TRProject
//
//  Created by tarenaios on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJSecondViewCell.h"

@implementation ZJSecondViewCell
- (UIImageView *)iconV {
    if(_iconV == nil) {
        _iconV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconV];
        _iconV.contentMode = UIViewContentModeScaleToFill;
        [_iconV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.titleLable.mas_top);
        }];
    }
    return _iconV;
}

- (UILabel *)titleLable {
    if(_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _titleLable;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self =[super initWithCoder:aDecoder]) {
        
    }
    return self;
}

@end
