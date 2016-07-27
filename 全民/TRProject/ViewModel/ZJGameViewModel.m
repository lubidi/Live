//
//  ZJGameViewModel.m
//  TRProject
//
//  Created by tarenaios on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJGameViewModel.h"

@implementation ZJGameViewModel
- (NSMutableArray<GameDataModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<GameDataModel *> alloc] init];
    }
    return _dataList;
}
-(void)getDataWithRequestMode:(VMRequestMode)requestMode slug:(NSString *)slug completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger pagNum = 0;
    if (requestMode == VMRequestModeMore) {
        pagNum = _page +1;
    }
    NSLog(@"%@",slug);
    _dataTask = [ZJNetManager getslug:slug page:pagNum completionHandler:^(ZJGameModel *model, NSError *error) {
        if (!error) {
            if (requestMode ==  VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page = pagNum;
            _hasOn = model.data.count !=0;
            }
        !completionHandler ?:completionHandler(error);
    }];
}

-(NSInteger)rowNmuber{
    return self.dataList.count;
}
- (GameDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}
-(NSString *)desLbForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)iconvForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.yx_URL;
}
-(NSString *)viewRowForRow:(NSInteger)row{
    NSString *num = [self modelForRow:row].view;
    NSInteger b = [num integerValue];
    if (b > 10000) {
        return [NSString stringWithFormat:@"%.1fW",b /10000.0];
    }
    return num;
}
-(NSURL *)avatarForRow:(NSInteger)row{
    return [self modelForRow:row].avatar.yx_URL;
}
- (NSString *)uidForRow:(NSInteger)row{
    return [self modelForRow:row].uid;
}
@end
