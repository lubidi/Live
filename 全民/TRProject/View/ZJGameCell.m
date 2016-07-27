//
//  ZJGameCell.m
//  TRProject
//
//  Created by tarenaios on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJGameCell.h"

@implementation ZJGameCell
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self =[super initWithCoder:aDecoder]) {
        
    }
    return self;
}
- (UIImageView *)thumbV {
    if(_thumbV == nil) {
        _thumbV = [[UIImageView alloc] init];
        [self.contentView addSubview:_thumbV];
//        _thumbV.layer.cornerRadius = 10;
        [_thumbV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.top.equalTo(0);
            make.bottom.equalTo(self.nickLb.mas_top);
        }];
    }
    return _thumbV;
}

- (UILabel *)nickLb {
    if(_nickLb == nil) {
        _nickLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nickLb];
        _nickLb.font = [UIFont systemFontOfSize:15];
        [_nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(self.titleLb.mas_top);
            make.left.equalTo(self.avatarV.mas_right).equalTo(5);
            make.height.equalTo(30);
        }];
    }
    return _nickLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.viewLb.mas_right).equalTo(5);
            make.bottom.right.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _titleLb;
}

- (UILabel *)viewLb {
    if(_viewLb == nil) {
        _viewLb = [[UILabel alloc] init];
        [self.contentView addSubview:_viewLb];
        _viewLb.font = [UIFont systemFontOfSize:11];
      [_viewLb mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.bottom.equalTo(0);
          make.height.equalTo(20);
          
      }];
        
    }
    return _viewLb;
}

- (UIImageView *)avatarV {
    if(_avatarV == nil) {
        _avatarV = [[UIImageView alloc] init];
        [self.contentView addSubview:_avatarV];
        _avatarV.layer.cornerRadius = 15;
        _avatarV.clipsToBounds = YES;
        [_avatarV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(30);
            make.left.equalTo(0);
            make.bottom.equalTo(self.viewLb.mas_top);
        }];
    }
    return _avatarV;
}
@end
