//
//  XHHorizontalCollectionItemView.m
//  XiangHa_3
//
//  Created by XH-LWR on 2017/11/9.
//  Copyright © 2017年 xiangha. All rights reserved.
//

#import "XHHorizontalCollectionItemView.h"

@interface XHHorizontalCollectionItemView () <UICollectionViewDelegateFlowLayout> {
    
    CGFloat _itemHeight;
}

@end

@implementation XHHorizontalCollectionItemView

- (void)createLayout {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing     = 0.f;
    layout.sectionInset                = UIEdgeInsetsZero;
    layout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
    self.layout                        = layout;
}

+ (instancetype)horizontalCollectionItemViewWithFrame:(CGRect)frame
                                            ItemSpace:(CGFloat)itemSpace
                                          contentEdge:(UIEdgeInsets)contentEdge {
    
    XHHorizontalCollectionItemView *itemView = [[XHHorizontalCollectionItemView alloc] initWithFrame:frame];
    itemView.itemSpace                     = itemSpace;
    itemView.contentEdge                   = contentEdge;
    
    return itemView;
}

+ (instancetype)horizontalCollectionItemViewWithFrame:(CGRect)frame
                                            ItemSpace:(CGFloat)itemSpace
                                          contentEdge:(UIEdgeInsets)contentEdge
                                             delegate:(id <XHCollectionViewDelegate>)delegate
                                        registerCells:(void (^)(XHHorizontalCollectionItemView *collectionView))registerCellsBlock
                                          addAdapters:(void (^)(NSMutableArray <XHCellDataAdapter *> *adapters))addAdaptersBlock {
    
    XHHorizontalCollectionItemView *itemView = [[XHHorizontalCollectionItemView alloc] initWithFrame:frame];
    itemView.itemSpace                     = itemSpace;
    itemView.contentEdge                   = contentEdge;
    itemView.delegate                      = delegate;
    
    registerCellsBlock ? registerCellsBlock(itemView) : 0;
    addAdaptersBlock   ? addAdaptersBlock(itemView.adapters) : 0;
    
    [itemView reloadData];
    
    return itemView;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.adapters[indexPath.row].cellWidth, _itemHeight);
}

#pragma mark - Overwrite system method.

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _itemHeight = self.collectionView.bounds.size.height - self.contentEdge.top - self.contentEdge.bottom;
}

#pragma mark - Setter

- (void)setItemSpace:(CGFloat)itemSpace {
    
    _itemSpace = itemSpace;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.layout;
    layout.minimumInteritemSpacing = itemSpace;
}

- (void)setContentEdge:(UIEdgeInsets)contentEdge {
    
    _contentEdge = contentEdge;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.layout;
    layout.sectionInset = contentEdge;
}

@end
