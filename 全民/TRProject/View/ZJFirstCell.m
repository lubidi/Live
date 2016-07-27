//
//  ZJFirstCell.m
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJFirstCell.h"

@implementation ZJFirstCell
- (UIImageView *)iconV {
    if(_iconV == nil) {
        _iconV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconV];
        [_iconV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.titleLable.top);
        }];
    }
    return _iconV;
}

- (UILabel *)titleLable {
    if(_titleLable == nil) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.font = [UIFont systemFontOfSize:18];
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
