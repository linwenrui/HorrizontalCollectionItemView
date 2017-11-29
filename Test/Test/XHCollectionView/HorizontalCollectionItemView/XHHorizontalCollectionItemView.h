//
//  XHHorizontalCollectionItemView.h
//  XiangHa_3
//
//  Created by XH-LWR on 2017/11/9.
//  Copyright © 2017年 xiangha. All rights reserved.
//

#import "XHCollectionView.h"

@interface XHHorizontalCollectionItemView : XHCollectionView

/**
 Item's space, default is 0.
 */
@property (nonatomic) CGFloat itemSpace;

/**
 Content's edge, default is
 */
@property (nonatomic) UIEdgeInsets contentEdge;

#pragma mark - Constructors

+ (instancetype)horizontalCollectionItemViewWithFrame:(CGRect)frame
                                            ItemSpace:(CGFloat)itemSpace
                                          contentEdge:(UIEdgeInsets)contentEdge;

+ (instancetype)horizontalCollectionItemViewWithFrame:(CGRect)frame
                                            ItemSpace:(CGFloat)itemSpace
                                          contentEdge:(UIEdgeInsets)contentEdge
                                             delegate:(id <XHCollectionViewDelegate>)delegate
                                        registerCells:(void (^)(XHHorizontalCollectionItemView *collectionView))registerCellsBlock
                                          addAdapters:(void (^)(NSMutableArray <XHCellDataAdapter *> *adapters))addAdaptersBlock;

@end
