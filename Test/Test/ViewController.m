//
//  ViewController.m
//  Test
//
//  Created by XH-LWR on 2017/11/29.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    CGFloat _cellH;
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray <NSString *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableview registerClass:TestTableViewCell.class forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.array = self.dataSource;
    _cellH = cell.cellH;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return _cellH;
}

#pragma mark - getter

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    }
    return _dataSource;
}

@end
