//
//  NSObject+lwx_associate.m
//  category中加属性
//
//  Created by luowenx on 16/3/31.
//  Copyright © 2016年 lwx. All rights reserved.
//

#import "NSObject+lwx_associate.h"
#import <objc/runtime.h>

@implementation NSObject (lwx_associate)
-(id)lwx_getAssociatedObjectForKey:(const char *)key{
    const char * propName = key;
    id currValue = objc_getAssociatedObject(self, propName);
    return currValue;
}

-(id)lwx_retainAssociatedObject:(id)obj forKey:(const char *)key{
    const char * propName = key;
    id oldValue = objc_getAssociatedObject(self, propName);
    objc_setAssociatedObject(self, propName, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return oldValue;
}


@end


@implementation NSObject(exchange)

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end
