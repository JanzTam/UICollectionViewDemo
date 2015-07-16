//
//  ViewController.m
//  Ex_CollectionView
//
//  Created by tangjianzhuo on 15/7/10.
//  Copyright (c) 2015年 JanzTam. All rights reserved.
//

#import "ViewController.h"

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth  [UIScreen mainScreen].bounds.size.width


@interface ViewController ()
{
    UICollectionViewFlowLayout * CFL;
    UICollectionView * CV;
    NSInteger countOfRowItem;//每一行item的数量
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"basicUse";
    self.slider.value = 4;
    self.slider.minimumValue = 2;
    self.slider.maximumValue = 32;
    
    
    countOfRowItem = 4;
    
    //创建UICollectionView之前一定要先配置好UICollectionViewFlowLayout
    CFL                         = [[UICollectionViewFlowLayout alloc]init];
    CFL.minimumInteritemSpacing = 1;//每个items之间的间隙
    CFL.minimumLineSpacing      = 1;//每行items之间的间隙
    
    
    CV            = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:CFL];
    CV.dataSource = self;
    CV.delegate   = self;
    [CV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"coll"];
    [self.view addSubview:CV];
    
    CV.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.view bringSubviewToFront:self.slider];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5000;
}

//设置cell，与tableview类似
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];
    
    CGFloat red     = arc4random()%256/255.0;
    CGFloat green   = arc4random()%256/255.0;
    CGFloat blue    = arc4random()%256/255.0;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(
                      (screenWidth-CFL.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem,
                      (screenWidth-CFL.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem);
}

//整个collectionview的edgeInserts
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WaterFallViewController * wFC = [WaterFallViewController new];
    [self.navigationController pushViewController:wFC animated:YES];
}

- (IBAction)changeCountNum:(UISlider *)sender {
    countOfRowItem = (NSInteger)sender.value;
    NSLog(@"count = %zd",countOfRowItem);
    [CV reloadData];
}
@end
