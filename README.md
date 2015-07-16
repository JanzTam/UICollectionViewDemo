# UICollectionViewDemo
UICollectionViewDemo,the basic  how to use 

![](https://github.com/JanzTam/UICollectionViewDemo/blob/master/UICollectionViewDemo/collectionView.gif)


#####.h:
```
UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
```


#####UICollectionViewFlowLayout
创建`UICollectionView`之前一定要先配置好`UICollectionViewFlowLayout`
```
    CFL                         = [[UICollectionViewFlowLayout alloc]init];
    CFL.minimumInteritemSpacing = 1;//每个items之间的间隙
    CFL.minimumLineSpacing      = 1;//每行items之间的间隙
```


#####UICollectionView
```
    CV            = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:CFL];
    CV.dataSource = self;
    CV.delegate   = self;
    [CV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"coll"];
    [self.view addSubview:CV];
```


#####实现代理方法
```
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5000;
}
```

//设置cell，与tableview类似
```
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];
    
    //随机背景色
    CGFloat red     = arc4random()%256/255.0;
    CGFloat green   = arc4random()%256/255.0;
    CGFloat blue    = arc4random()%256/255.0;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return cell;
}
```

//item大小
```
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(
                      (screenWidth-CFL.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem,
                      (screenWidth-CFL.minimumInteritemSpacing*(countOfRowItem+1))/countOfRowItem);
}
```

//section的edgeInserts
```
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing,
                            CFL.minimumInteritemSpacing);
}
```

