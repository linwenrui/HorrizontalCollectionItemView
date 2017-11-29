//
//  XHHorizontalCollectionItemViewCell.h
//  XiangHa_3
//
//  Created by XH-LWR on 2017/11/9.
//  Copyright © 2017年 xiangha. All rights reserved.
//

#import "XHBaseCustomCollectionCell.h"

@class XHHorizontalCollectionItemView;

@interface XHHorizontalCollectionItemViewCell : XHBaseCustomCollectionCell

+ (XHCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier cellWidth:(CGFloat)width data:(id)data type:(NSInteger)type;
+ (XHCellDataAdapter *)dataAdapterWithData:(id)data cellWidth:(CGFloat)width type:(NSInteger)type;
+ (XHCellDataAdapter *)dataAdapterWithData:(id)data cellWidth:(CGFloat)width;

+ (void)registerToHorizontalCollectionItemView:(XHHorizontalCollectionItemView *)collectionView;
+ (void)registerToHorizontalCollectionItemView:(XHHorizontalCollectionItemView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier;

@end
