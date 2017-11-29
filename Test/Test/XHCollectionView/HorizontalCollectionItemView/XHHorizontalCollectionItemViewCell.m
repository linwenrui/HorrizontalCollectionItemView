//
//  XHHorizontalCollectionItemViewCell.m
//  XiangHa_3
//
//  Created by XH-LWR on 2017/11/9.
//  Copyright © 2017年 xiangha. All rights reserved.
//

#import "XHHorizontalCollectionItemViewCell.h"
#import "XHHorizontalCollectionItemView.h"

@implementation XHHorizontalCollectionItemViewCell

+ (XHCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier cellWidth:(CGFloat)width data:(id)data type:(NSInteger)type {
    
    NSString        *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    XHCellDataAdapter *adapter          = [XHCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellType:type];
    adapter.cellWidth                   = width;
    
    return adapter;
}

+ (XHCellDataAdapter *)dataAdapterWithData:(id)data cellWidth:(CGFloat)width type:(NSInteger)type {
    
    XHCellDataAdapter *adapter          = [XHCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class]) data:data cellType:type];
    adapter.cellWidth                   = width;
    
    return adapter;
}

+ (XHCellDataAdapter *)dataAdapterWithData:(id)data cellWidth:(CGFloat)width {
    
    XHCellDataAdapter *adapter          = [XHCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class]) data:data cellType:0];
    adapter.cellWidth                   = width;
    
    return adapter;
}

+ (void)registerToHorizontalCollectionItemView:(XHHorizontalCollectionItemView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier {
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier.length ? reuseIdentifier : NSStringFromClass([self class])];
}

+ (void)registerToHorizontalCollectionItemView:(XHHorizontalCollectionItemView *)collectionView {
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}

@end
