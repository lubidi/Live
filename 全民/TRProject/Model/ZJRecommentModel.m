//
//  ZJRecommentModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJRecommentModel.h"

@implementation ZJRecommentModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"mobliewebgame" :@"moblie-webgame",
                  @"moblieminecraft" :@"moblie-minecraft",
                  @"mobiletvgame" :@"mobile-tvgame",
                  @"mobliesport" :@"moblie-sport",
                  @"mobilestar" :@"mobile-star",
                  @"mobilerecommendation" :@"mobile-recommendation",
                  @"mobileindex" :@"mobile-index",
                  @"mobilelol" :@"mobile-lol",
                  @"mobilebeauty" :@"mobile-beauty",
                  @"mobileheartstone" :@"mobile-heartstone",
                  @"moblieblizzard" :@"moblie-blizzard",
                  @"mobiledota2" :@"mobile-dota2",
                  @"mobliednf" :@"moblie-dnf"
             };
    
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"mobliewebgame" : [MobileBeauty class], @"moblieminecraft" : [MobileBeauty class], @"mobiletvgame" : [MobileBeauty class], @"mobliesport" : [MobileBeauty class], @"mobilestar" : [MobileStar class], @"mobilerecommendation" : [MobileBeauty class], @"mobilelol" : [MobileBeauty class], @"mobileheartstone" : [MobileBeauty class], @"moblieblizzard" : [MobileBeauty class], @"mobilebeauty" : [MobileBeauty class], @"mobileindex" : [MobileBeauty class], @"list" : [List class], @"mobiledota2" : [MobileBeauty class], @"mobliednf" : [MobileBeauty class]};

}

@end

@implementation MobileStar
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end

@implementation List

@end

@implementation MobileBeauty

@end

@implementation LinkObject
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"newstarttime" : @"new_start_time",
             @"lastendat" : @"last_end_at",
             @"firstplayat" :@"first_play_at",
             @"appshufflingimage" :@"app_shuffling_image"
                 };
}

@end



