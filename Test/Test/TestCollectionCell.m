//
//  TestCollectionCell.m
//  Test
//
//  Created by XH-LWR on 2017/11/29.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "TestCollectionCell.h"

@interface TestCollectionCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TestCollectionCell

- (void)buildSubview {
    
    self.contentView.backgroundColor = [UIColor yellowColor];
    self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont boldSystemFontOfSize:30];
    [self.contentView addSubview:self.label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(todo) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
}

- (void)loadContent {
    
    self.label.text = (NSString *)self.data;
}

- (void)todo {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customCollectionCell:event:)]) {
        
        [self.delegate customCollectionCell:self event:self.data];
    }
}

@end
