//
//  main.m
//  ServerSocketTest
//
//  Created by myxc on 31/05/2018.
//  Copyright © 2018 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKLSocketService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSLog(@"Hello, World!");
        //创建服务对象
        LKLSocketService *socketSerview = [[LKLSocketService alloc]init];
        //开始服务
        [socketSerview start];
        //循环运行
        [[NSRunLoop mainRunLoop]run];//目的让服务器不停止
        
    }
    return 0;
}
