//
//  TestTableViewCell.m
//  Test
//
//  Created by XH-LWR on 2017/11/29.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "TestTableViewCell.h"
#import "XHHorizontalCollectionItemView.h"
#import "TestCollectionCell.h"

@interface TestTableViewCell () <XHCollectionViewDelegate>

// Collectionview
@property (nonatomic, strong) XHHorizontalCollectionItemView *horizontalItemView;
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation TestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setArray:(NSArray<NSString *> *)array {
    
    _array = array;
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.horizontalItemView];
}

#pragma mark - XHCollectionViewDelegate

- (void)xhCollectionView:(XHCollectionView *)xhCollectionView didSelectCell:(UICollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了单元格 - %ld", indexPath.row);
}

- (void)xhCollectionView:(XHCollectionView *)customCollectionView cell:(XHBaseCustomCollectionCell *)cell event:(id)event {
    
    NSLog(@"点击了按钮 - %@", event);
}

#pragma mark - getter

- (UILabel *)titleLab {
    
    if (!_titleLab) {
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        _titleLab.text = self.array[1];
    }
    return _titleLab;
}

- (XHHorizontalCollectionItemView *)horizontalItemView {
    
    if (!_horizontalItemView) {
        
        _horizontalItemView = [XHHorizontalCollectionItemView horizontalCollectionItemViewWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLab.frame) + 13, self.contentView.frame.size.width, 100) ItemSpace:10 contentEdge:UIEdgeInsetsMake(0, 20, 0, 20) delegate:self registerCells:^(XHHorizontalCollectionItemView *collectionView) {
            
            [TestCollectionCell registerToHorizontalCollectionItemView:collectionView];
        } addAdapters:^(NSMutableArray<XHCellDataAdapter *> *adapters) {
            
            [self.array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (idx == 0) {
                    
                    [adapters addObject:[TestCollectionCell dataAdapterWithData:obj cellWidth:200]];
                } else if (idx == 1) {
                    
                    [adapters addObject:[TestCollectionCell dataAdapterWithData:obj cellWidth:100]];
                } else {
                    
                    [adapters addObject:[TestCollectionCell dataAdapterWithData:obj cellWidth:300]];
                }
//                [adapters addObject:[TestCollectionCell dataAdapterWithData:obj cellWidth:XHHorizontalCell1W type:1]];
            }];
        }];
    }
    return _horizontalItemView;
}

- (CGFloat)cellH {
    
    return CGRectGetMaxY(self.horizontalItemView.frame) + 10;
}

@end
