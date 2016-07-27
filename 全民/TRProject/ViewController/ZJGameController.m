//
//  ZJGameController.m
//  TRProject
//
//  Created by tarenaios on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJGameController.h"
#import "ZJGameViewModel.h"
#import "ZJGameCell.h"
#import "ZJNetManager.h"
@import MediaPlayer;

@interface ZJGameController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic)ZJGameViewModel *game;
@end

@implementation ZJGameController

static NSString * const reuseIdentifier = @"Cell";


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSString stringWithFormat:kMovePath,[self.game uidForRow:indexPath.row]].yx_URL];
     [self.navigationController pushViewController:vc animated:YES];  
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _name;
    [self.collectionView registerClass:[ZJGameCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.game getDataWithRequestMode:VMRequestModeRefresh slug:self.gameList completionHandler:^(NSError *error) {
    
            if (error) {
                    DDLogError(@"%@", error);
            }
            [self.collectionView reloadData];
            if (self.game.hasOn) {
                [self.collectionView.mj_footer resetNoMoreData];
            }else{
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.collectionView endHeaderRefresh];
        }];
    }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
     [self.game getDataWithRequestMode:VMRequestModeMore  slug:self.gameList completionHandler:^(NSError *error) {
         [self.collectionView.mj_footer endRefreshing];
         [self.collectionView reloadData];
         if (!self.game.hasOn) {
             [self.collectionView.mj_footer endRefreshingWithNoMoreData];
         }
     }];
    }];
    
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.game.rowNmuber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.thumbV sd_setImageWithURL:[self.game iconvForRow:indexPath.row]];
    [cell.avatarV sd_setImageWithURL:[self.game avatarForRow:indexPath.row]];
    cell.nickLb.text = [self.game titleForRow:indexPath.row];
    cell.titleLb.text = [self.game desLbForRow:indexPath.row];
    cell.viewLb.text = [self.game viewRowForRow:indexPath.row];

    
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

- (ZJGameViewModel *)game {
	if(_game == nil) {
		_game = [[ZJGameViewModel alloc] init];
	}
	return _game;
}

@end
