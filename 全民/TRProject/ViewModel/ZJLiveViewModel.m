//
//  ZJLiveViewModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJLiveViewModel.h"

@implementation ZJLiveViewModel
- (NSMutableArray<LiveDataModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<LiveDataModel *> alloc] init];
    }
    return _dataList;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmPage = 0;
    if (requestMode ==VMRequestModeMore) {
        tmPage = _page +1;
    }
    _dataTask = [ZJNetManager getLivepage:tmPage completionHandler:^(ZJLiveModel *model, NSError *error) {
        if (!error) {
            if (requestMode == VMRequestModeRefresh) {
                 [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page =tmPage;
            _isMore = model.data.count !=0;
        }
        !completionHandler ?:completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (LiveDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}
- (NSString *)desLbForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)iconvForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.yx_URL;
}
-(NSURL *)avatarForRow:(NSInteger)row{
    return [self modelForRow:row].avatar.yx_URL;
}
-(NSString *)viewRowForRow:(NSInteger)row{
    NSString *num = [self modelForRow:row].view;
    NSInteger num1 = [num integerValue];
    if (num1 >= 10000) {
        return [NSString stringWithFormat:@"%.1fW",num1 / 10000.0];
    }
    return num;
}

-(NSString *)uidForRow:(NSInteger)row{
    return [self modelForRow:row].uid;
}
@end
