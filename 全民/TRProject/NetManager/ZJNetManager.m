//
//  ZJNetManager.m
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJNetManager.h"

@implementation ZJNetManager
+(id)completionHandle:(void (^)(ZJRecommentModel *, NSError *))completionHandle{
    return [self GET:kRecommentPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandle?:completionHandle([ZJRecommentModel parseJSON:jsonObject],error);
    }];
}

//栏目
+ (id)getColumnCompletionHandle:(void (^)(ZJColumnModel *, NSError *))completionhandle{
    return [self GET:kColumnPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandle ?: completionhandle([ZJColumnModel parseJSON:jsonObject],error);
    }];
    
}
//游戏
+(id)getslug:(NSString *)slug page:(NSInteger)page completionHandler:(void (^)(ZJGameModel *, NSError *))completionHandler{
    NSString *path  = nil;
    if (page == 0) {
        path = [NSString stringWithFormat:@"http://www.quanmin.tv/json/categories/%@/list.json",slug];
    }else{
    path = [NSString stringWithFormat:kGamePath,slug,page];
    }
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZJGameModel parseJSON:jsonObject],error);
    }];
    
}

//直播
+(id)getLivepage:(NSInteger)page completionHandler:(void (^)(ZJLiveModel *, NSError *))completionHandler{
    NSString *path = nil;
    if (page == 0) {
        path = @"http://www.quanmin.tv/json/play/list.json";
    }else{
    path = [NSString stringWithFormat:kLivePath,page];
    }
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZJLiveModel parseJSON:jsonObject],error);
    }];
}

@end
