//
//  main.m
//  字符串与路径
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    NSString *str = @"/Users/chenliangjing/Desktop/test.txt";
    // 1.判断是否是一个绝对路径
    // 本质是判断字符串是否以“/”开头
    bool flag = [str isAbsolutePath];
    if (flag)
    {
        NSLog(@"str 是一个绝对路径"); // str 是一个绝对路径
    }
    else
    {
        NSLog(@"str 不是一个绝对路径");
    }
    
    // 2. 获取文件路径中的最后一个目录
    // 本质是获取路径中最后一个/后面的内容
    NSString *lastDir = [str lastPathComponent];
    NSLog(@"lastDir = %@", lastDir); // lastDir = test.txt
    
    
    // 3. 删除文件路径中的最后一个目录
    // 本质是删除最后一个"/"以及后面的内容
    NSString *newStr = [str stringByDeletingLastPathComponent];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = /Users/chenliangjing/Desktop/test.txt, newStr = /Users/chenliangjing/Desktop
    
    // 4. 给文件路径添加一个目录
    // 如果原路径后面已经有了"/"，则不会在添加“/”，如果有没有，怎会添加“/”，如果有多个"/",则会删除多余的"/"，只保留一个"/"
    NSString *addDir = @"chenliangjing.tex";
    newStr = [str stringByAppendingPathComponent:addDir];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = /Users/chenliangjing/Desktop/test.txt, newStr = /Users/chenliangjing/Desktop/test.txt/chenliangjing.tex
    
    // 5. 获取路径中的文件扩展名
    // 本质是从字符串的末尾开始查找，截取第一个"."后面的内容
    NSString *extName = [str pathExtension];
    NSLog(@"extName = %@", extName); // extName = txt
    
    // 6. 删除路径中的文件扩展名
    // 本质是从字符串的末尾开始查找，删除第一个"."后面的内容
    newStr = [str stringByDeletingPathExtension];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = /Users/chenliangjing/Desktop/test.txt, newStr = /Users/chenliangjing/Desktop/test
    
    // 7. 给文件路径天机一个扩展名
    NSString *addExtName = @"gif";
    newStr = [newStr stringByAppendingPathExtension:addExtName];
    NSLog(@"newStr = %@", newStr); // newStr = /Users/chenliangjing/Desktop/test.gif
    
    return 0;
}
