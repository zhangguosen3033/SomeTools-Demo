//
//  TableDataSource.m
//  UnitTestProject
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import "TableDataSource.h"

@interface TableDataSource ()
@property (nonatomic, strong)NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@end

@implementation TableDataSource

- (instancetype)init{
    return [super init];

}

- (instancetype)initWithItems:(NSArray*)anitems
               cellIdentifier:(NSString*)aCellIdentifier
           configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    self = [super init];
    if (self) {
        self.items = anitems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath{
    return _items[indexPath.row];
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellIdentifier];
    }
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}


@end
