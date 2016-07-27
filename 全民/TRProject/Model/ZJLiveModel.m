//
//  ZJLiveModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJLiveModel.h"

@implementation ZJLiveModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
     return @{@"data" : [LiveDataModel class]};
}


@end
@implementation LiveRecommendModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
        return @{@"data" : [LiveRecommendDataModel class]};
}


@end


@implementation LiveRecommendDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}
@end


@implementation LiveRecommendDataLink_ObjectModel

@end


@implementation LiveDataModel

@end


