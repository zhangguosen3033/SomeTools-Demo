//
//  UIImage+Scale.h
//  UnitTestDemo
//
//  Created by gdy on 16/2/25.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end
