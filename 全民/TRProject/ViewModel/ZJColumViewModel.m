//
//  ZJColumViewModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJColumViewModel.h"

@implementation ZJColumViewModel
- (NSMutableArray<ZJColumnModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<ZJColumnModel *> alloc] init];
    }
    return _dataList;
}
-(void)getDataColumCompletionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [ZJNetManager getColumnCompletionHandle:^(ZJColumnModel *model, NSError *error) {
   
            [self.dataList addObjectsFromArray:(NSArray *)model];
        !completionHandler ?:completionHandler(error);
    }];
}
-(ZJColumnModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
-(NSInteger)rowMumber{
    return self.dataList.count;
}
-(NSURL *)imageForRow:(NSInteger)row{
    return [self modelForRow:row].image.yx_URL;
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
@end
