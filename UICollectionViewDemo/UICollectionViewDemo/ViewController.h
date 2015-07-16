//
//  ViewController.h
//  Ex_CollectionView
//
//  Created by tangjianzhuo on 15/7/10.
//  Copyright (c) 2015年 JanzTam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterFallViewController.h"


@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)changeCountNum:(UISlider *)sender;
@end

