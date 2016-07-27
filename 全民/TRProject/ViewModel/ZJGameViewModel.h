//
//  ZJGameViewModel.h
//  TRProject
//
//  Created by tarenaios on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZJNetManager.h"
@interface ZJGameViewModel : TRBaseViewModel
/** <#属性声明#> */
@property(nonatomic) NSInteger rowNmuber;
- (NSURL *)iconvForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)desLbForRow:(NSInteger)row;
-(NSURL *)avatarForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;
@property(nonatomic) NSMutableArray<GameDataModel *> *dataList;
@property(nonatomic) NSInteger page;

-(GameDataModel *)modelForRow:(NSInteger)row;
-(NSString *)viewRowForRow:(NSInteger)row;
- (void)getDataWithRequestMode:(VMRequestMode)requestMode slug:(NSString *)slug completionHandler:(void(^)(NSError *error))completionHandler;
/** <#属性声明#> */
@property(nonatomic, readonly) BOOL hasOn;
@end
