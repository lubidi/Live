//
//  ZJGameModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJGameModel.h"

@implementation ZJGameModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
       return @{@"data" : [GameDataModel class]};
}

@end
@implementation GameDataModel

@end


