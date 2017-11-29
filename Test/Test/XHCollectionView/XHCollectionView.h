//
//  XHCollectionView.h
//  XiangHa_3
//
//  Created by XH-LWR on 2017/11/9.
//  Copyright © 2017年 xiangha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHBaseCustomCollectionCell.h"
@class XHCollectionView;

@protocol XHCollectionViewDelegate <NSObject>

@optional

/**
 XHCollectionView did select cell.

 @param xhCollectionView The xhCollectionView.
 @param cell The UICollectionViewCell's cell.
 @param indexPath The indexPath.
 */
- (void)xhCollectionView:(XHCollectionView *)xhCollectionView didSelectCell:(UICollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath;

/**
 The customCollectionView's cell event.
 
 [IMPORMANT] The cell must call it's delegate's methods '- (void)customCollectionCell:(BaseCustomCollectionCell *)cell event:(id)event;' to make this active.
 
 @param customCollectionView The CustomCollectionView.
 @param cell The BaseCustomCollectionCell's cell.
 @param event The cell's event.
 */
- (void)xhCollectionView:(XHCollectionView *)customCollectionView cell:(XHBaseCustomCollectionCell *)cell event:(id)event;

@end

@interface XHCollectionView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, CustomCollectionCellDelegate>

/**
 The custom collectionView's delegate.
 */
@property (nonatomic, weak) id <XHCollectionViewDelegate> delegate;

/**
 The collectionView.
 */
@property (nonatomic, strong) UICollectionView  *collectionView;

/**
 The collectionView's layout.
 */
@property (nonatomic, strong) UICollectionViewLayout *layout;

/**
 The cell's data adapters.
 */
@property (nonatomic) NSMutableArray <XHCellDataAdapter *> *adapters;

/**
 Register cell's class with reuseIdentifier.
 
 @param cellClass HorizontalCollectionItemViewCell's subclass.
 @param reuseIdentifier The reuseIdentifier.
 */
- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)reuseIdentifier;

/**
 Register cell's class with the class's name.
 
 @param cellClass HorizontalCollectionItemViewCell's subclass.
 */
- (void)registerClass:(Class)cellClass;

/**
 Reload the data.
 */
- (void)reloadData;

/**
 Animates multiple insert, delete, reload, and move operations as a group.
 
 @param editAdaptersBlock Edit the dataSource.
 @param editItemsBlock Edit the indexPaths.
 @param completionBlock Completion callback.
 */
- (void)editCustomCollectionViewAdapters:(void (^)(NSMutableArray <XHCellDataAdapter *> *adapters))editAdaptersBlock
                   editItemsAtIndexPaths:(void (^)(UICollectionView  *collectionView))editItemsBlock
                              completion:(void (^)(BOOL finished))completionBlock;

#pragma mark - Overwrite by sub class

/**
 [- Overwrite by sub class -] Create the layout.
 */
- (void)createLayout;

/**
 [- Overwrite by sub class -] setup.
 */
- (void)setup;

@end
