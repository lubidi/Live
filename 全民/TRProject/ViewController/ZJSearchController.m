//
//  ZJSearchController.m
//  TRProject
//
//  Created by tarenaios on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZJSearchController.h"
#import "ZJSecondController.h"
@interface ZJSearchController ()
@property (nonatomic) UITextField *searchTF;
/** <#属性声明#> */
@property(nonatomic) UICollectionViewFlowLayout *coll;
@end

@implementation ZJSearchController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self searchTF];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"全屏返回-按下@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.59240.000.00."] style:UIBarButtonItemStyleDone target:self action:@selector(getBack:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    UIBarButtonItem *rightBtn =[ [UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"搜索-按下@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(searchMessage:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}
- (void)getBack:(id)sender{
//    ZJSecondController *vc = [[ZJSecondController alloc] initWithCollectionViewLayout:self.coll];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)searchMessage:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
 
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


- (UITextField *)searchTF {
	if(_searchTF == nil) {
        _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        self.navigationItem.titleView = _searchTF;
        _searchTF.placeholder = @"请输入关键字";
        _searchTF.layer.cornerRadius = 10;
        _searchTF.clipsToBounds = YES;
        _searchTF.font = [UIFont systemFontOfSize:16];
        _searchTF.borderStyle = UITextBorderStyleRoundedRect;
        
	}
	return _searchTF;
}

- (UICollectionViewFlowLayout *)coll {
	if(_coll == nil) {
		_coll = [[UICollectionViewFlowLayout alloc] init];
	}
	return _coll;
}

@end
