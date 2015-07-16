//
//  WaterFallViewController.m
//  Ex_CollectionView
//
//  Created by tangjianzhuo on 15/7/11.
//  Copyright (c) 2015年 JanzTam. All rights reserved.
//

#import "WaterFallViewController.h"
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth  [UIScreen mainScreen].bounds.size.width

@interface WaterFallViewController ()
{
    UICollectionViewFlowLayout * cViewLayout;
    UICollectionView * collectionV;
    NSInteger countOfRowItem;
}
@end

@implementation WaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    countOfRowItem = 4;

    cViewLayout = [[UICollectionViewFlowLayout alloc]init];
    cViewLayout.minimumInteritemSpacing = 2;
    cViewLayout.minimumLineSpacing = 2;
    
    collectionV = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:cViewLayout];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    [self.view addSubview:collectionV];
    
    collectionV.backgroundColor = [UIColor colorWithRed:0.943 green:0.988 blue:1.000 alpha:1.000];
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"waterFallCell"];
    
    //注册headView
    [collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    //注册footView
    [collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 32;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"waterFallCell" forIndexPath:indexPath];
    
    CGFloat red     = arc4random() % 256/255.0;
    CGFloat green   = arc4random() % 256/255.0;
    CGFloat blue    = arc4random() % 256/255.0;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

//    CGFloat heightOfItem = 50 + arc4random() % 200;
    return CGSizeMake(
                      (screenWidth-cViewLayout.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem,
                      (screenWidth-cViewLayout.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(cViewLayout.minimumInteritemSpacing,
                            cViewLayout.minimumInteritemSpacing,
                            cViewLayout.minimumInteritemSpacing,
                            cViewLayout.minimumInteritemSpacing);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

//head
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(screenWidth, 100);
}

//head & foot
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //根据kind来区分head/foot
    if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        UICollectionReusableView * cRFootView = [collectionV dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footView" forIndexPath:indexPath];
        
        
        CGFloat red     = arc4random() % 256/255.0;
        CGFloat green   = arc4random() % 256/255.0;
        CGFloat blue    = arc4random() % 256/255.0;
        cRFootView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        
        UILabel * l     = [[UILabel alloc]initWithFrame:cRFootView.bounds];
        l.text          = @"YOU!";
        l.textColor     = [UIColor whiteColor];
        l.textAlignment = NSTextAlignmentCenter;
        l.font          = [UIFont boldSystemFontOfSize:24];
        [cRFootView addSubview:l];
        
        return cRFootView;
    }
    
    UICollectionReusableView * cRView = [collectionV dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headView" forIndexPath:indexPath];
    
    
    CGFloat red     = arc4random() % 256/255.0;
    CGFloat green   = arc4random() % 256/255.0;
    CGFloat blue    = arc4random() % 256/255.0;
    cRView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    UILabel * l     = [[UILabel alloc]initWithFrame:cRView.bounds];
    l.text          = @"What the fuck?";
    l.textColor     = [UIColor whiteColor];
    l.textAlignment = NSTextAlignmentCenter;
    l.font          = [UIFont boldSystemFontOfSize:24];
    [cRView addSubview:l];
    
    return cRView;
}


//foot
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(screenWidth, 50);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
