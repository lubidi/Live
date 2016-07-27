//
//  ZJColumViewModel.h
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZJNetManager.h"
@interface ZJColumViewModel : TRBaseViewModel
@property(nonatomic) NSInteger rowMumber;
-(NSURL *)imageForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(ZJColumnModel *)modelForRow:(NSInteger)row;
@property(nonatomic) NSMutableArray<ZJColumnModel *> *dataList;
-(void) getDataColumCompletionHandler:(void(^)(NSError *error))completionHandler;


@end
