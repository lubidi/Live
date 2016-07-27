//
//  ZJNetManager.h
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJRecommentModel.h"
#import "ZJColumnModel.h"
#import "ZJGameModel.h"
#import "ZJLiveModel.h"
@interface ZJNetManager : NSObject
+(id)completionHandle:(void(^)(ZJRecommentModel *model,NSError *error))completionHandle;
//栏目
+(id)getColumnCompletionHandle:(void(^)(ZJColumnModel *model,NSError *error))completionhandle;
//游戏
+(id)getslug:(NSString *)slug page:(NSInteger)page completionHandler:(void(^)(ZJGameModel *model,NSError *error))completionHandler;
//直播
+(id)getLivepage:(NSInteger)page  completionHandler:(void(^)(ZJLiveModel *model,NSError *error))completionHandler;
@end
