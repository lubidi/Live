//
//  ZJSecondController.m
//  TRProject
//
//  Created by tarenaios on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJSecondController.h"
#import "ZJSecondViewCell.h"
#import "ZJColumViewModel.h"
#import "ZJGameController.h"
#import "ZJSearchController.h"
@interface ZJSecondController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic) ZJColumViewModel *columList;
/** <#属性声明#> */
@property(nonatomic) UICollectionViewFlowLayout *coll;
@end

@implementation ZJSecondController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"栏目";
    UIBarButtonItem *rightBtn =[ [UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"搜索-按下@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(searchMessage:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ZJSecondViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.columList getDataColumCompletionHandler:^(NSError *error) {
        [self.collectionView reloadData];
    }];
}

-(void) searchMessage:(id)sender{
    ZJSearchController *vc = [[ZJSearchController alloc]initWithCollectionViewLayout:self.coll];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.columList.rowMumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJSecondViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.iconV sd_setImageWithURL:[self.columList imageForRow:indexPath.row]];
    cell.titleLable.text = [self.columList titleForRow:indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenW - 4 *10) /3;
    CGFloat height = width *320/230 + 20;
    return  CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(10, 10, 10, 10);
}


- (ZJColumViewModel *)columList {
    if(_columList == nil) {
        _columList = [[ZJColumViewModel alloc] init];
    }
    return _columList;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZJGameController *vc = [[ZJGameController alloc]initWithCollectionViewLayout:self.coll];
    vc.gameList = [self.columList modelForRow:indexPath.row].slug;

    vc.name = [self.columList titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionViewFlowLayout *)coll {
	if(_coll == nil) {
		_coll = [[UICollectionViewFlowLayout alloc] init];
       
	}
	return _coll;
}

@end
