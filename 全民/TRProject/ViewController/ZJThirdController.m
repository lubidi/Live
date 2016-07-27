//
//  ZJThirdController.m
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJThirdController.h"
#import "ZJGameCell.h"
#import "ZJLiveViewModel.h"
#import "ZJSearchController.h"
@import MediaPlayer;
@interface ZJThirdController ()<UICollectionViewDelegateFlowLayout>
/** <#属性声明#> */
@property(nonatomic) ZJLiveViewModel *liveList;
@property(nonatomic) UICollectionViewFlowLayout *coll;
@end

@implementation ZJThirdController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
     self.collectionView.backgroundColor = [UIColor whiteColor];
     self.navigationItem.title = @"直播";
    UIBarButtonItem *rightBtn =[ [UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"搜索-按下@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(searchMessage:)];
    self.navigationItem.rightBarButtonItem = rightBtn;

    [self.collectionView registerClass:[ZJGameCell class] forCellWithReuseIdentifier:reuseIdentifier];
     self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.liveList getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
           [self.collectionView reloadData];
           if (self.liveList.isMore) {
               [self.collectionView.mj_footer resetNoMoreData];
           }else{
               [self.collectionView.mj_footer endRefreshingWithNoMoreData];
           }
           [self.collectionView endHeaderRefresh];
       }];
     }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.liveList getDataWithRequestMode:VMRequestModeMore  completionHandler:^(NSError *error) {
            [self.collectionView.mj_footer endRefreshing];
            [self.collectionView reloadData];
            if (!self.liveList.isMore) {
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }

        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

-(void) searchMessage:(id)sender{
    ZJSearchController *vc = [[ZJSearchController alloc]initWithCollectionViewLayout:self.coll];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSString stringWithFormat:kMovePath,[self.liveList uidForRow:indexPath.row]].yx_URL];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.liveList.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.thumbV sd_setImageWithURL:[self.liveList iconvForRow:indexPath.row]];
    [cell.avatarV sd_setImageWithURL:[self.liveList avatarForRow:indexPath.row]];
    cell.nickLb.text = [self.liveList titleForRow:indexPath.row];
    cell.titleLb.text = [self.liveList desLbForRow:indexPath.row];
    cell.viewLb.text = [self.liveList viewRowForRow:indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW - 3 *10) /2;
    CGFloat height = width *280/350 + 20;
    return  CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(10, 10, 10, 10);
}


- (ZJLiveViewModel *)liveList {
	if(_liveList == nil) {
		_liveList = [[ZJLiveViewModel alloc] init];
	}
	return _liveList;
}

- (UICollectionViewFlowLayout *)coll {
	if(_coll == nil) {
		_coll = [[UICollectionViewFlowLayout alloc] init];
	}
	return _coll;
}

@end
