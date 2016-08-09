//
//  main.m
//  算法练习C
//
//  Created by Apple on 16/8/9.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int i, j, temp;
        
        int a[] = {1,3,9,8,2,4,5,7,6,0,11};
        
        int length = sizeof(a)/sizeof(a[0]);
        
        for (j = 0; j < length; j++)
        {
            for (i = 0; i < length - j - 1; i++)
            {
                if (a[i] > a[i + 1])
                {
                    temp = a[i];
                    
                    a[i] = a[i + 1];
                    
                    a[i + 1] = temp;
                }
            }
        }
        
        for (i = 0; i < length; i++)
        {
            printf("%d,", a[i]);
        } 
        printf("\n");
        

    }
    return 0;
}
