//
//  TableDataSource.h
//  UnitTestProject
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell,id item);

@interface TableDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithItems:(NSArray*)anitems
               cellIdentifier:(NSString*)aCellIdentifier
           configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath*)indexPath;

@end
