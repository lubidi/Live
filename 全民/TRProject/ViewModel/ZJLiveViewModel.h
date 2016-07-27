//
//  ZJLiveViewModel.h
//  TRProject
//
//  Created by tarenaios on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZJNetManager.h"
@interface ZJLiveViewModel : TRBaseViewModel
/** <#属性声明#> */
@property(nonatomic) NSInteger rowNumber;
- (NSURL *)iconvForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)desLbForRow:(NSInteger)row;
-(NSURL *)avatarForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;
-(NSString *)viewRowForRow:(NSInteger)row;

-(LiveDataModel *)modelForRow:(NSInteger)row;

@property(nonatomic) NSMutableArray<LiveDataModel *> *dataList;

@property(nonatomic) NSInteger page;
@property(nonatomic, readonly) BOOL isMore;


@end
