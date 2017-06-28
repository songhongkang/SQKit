//
//  NSObject+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <objc/runtime.h>
#import "NSObject+SQExtension.h"
#import "NSString+SQExtension.h"

@implementation NSObject (SQExtension)

+ (NSString *)sq_name {
    return [NSString sq_stringWithClass:self];
}

- (NSString *)sq_name {
    return [self class].sq_name;
}

#pragma mark - Runtime
/**
 *  遍历成员属性
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
- (void)sq_enumerateKeysAndObjectsBackwardClass:(Class)class
                                          block:(void (^)(NSString *key, id obj, BOOL *stop))block {
    
    // 非SEL类型变量
//    if (strcmp(ivar_getTypeEncoding(vars[i]), @encode(SEL))) {
//        block(key, [self valueForKeyPath:key], &stop);
//    } else {
//        block(key, NSStringFromSelector((__bridge void *)object_getIvar(self, vars[i])), &stop);
//    }
}
/**
 *  遍历对象方法
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
- (void)sq_enumerateSelectorsBackwardClass:(Class)class block:(void (^)(SEL sel, BOOL *stop))block {
    
}
/**
 *  遍历类方法
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
+ (void)sq_enumerateSelectorsBackwardClass:(Class)class block:(void (^)(SEL sel, BOOL *stop))block {
    
}

/**
 *  遍历runtime中的类
 *  @param block    每遍历到一个类block被回调, *stop = YES, 停止遍历
 *
 */
+ (void)sq_enumerateClassListUsingBlock:(void (^)(Class class, BOOL *stop))block {
    
    int classCount = objc_getClassList(NULL, 0);
    
    if (classCount > 0) {
        Class *classList = (Class *)malloc(sizeof(Class) * classCount);
        objc_getClassList(classList, classCount);
        
        if (block) {
            BOOL isStop = NO;
            for (unsigned int i = 0; i < classCount; i++) {
                block(classList[i], &isStop);
                if (isStop) break;
            }
        }
        free(classList);
    }
}

/**
 *  交换两个类方法实现
 */
+ (void)sq_swizzlingClassSelector:(SEL)sel otherSelector:(SEL)otherSel {
    method_exchangeImplementations(class_getClassMethod(self, sel),
                                   class_getClassMethod(self, otherSel));
}

/**
 *  交换两个实例方法实现
 */
+ (void)sq_swizzlingInstanceSelector:(SEL)sel otherSelector:(SEL)otherSel {    
    method_exchangeImplementations(class_getInstanceMethod(self, sel),
                                   class_getInstanceMethod(self, otherSel));
}

#pragma mark - Copying
/**
 *  拷贝一个新的对象
 */
- (instancetype)sq_copy {
    return nil;
}
/**
 *  去除不需要拷贝的属性
 */
- (NSArray<NSString *> *)sq_weedCopyKeys {
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

#pragma mark - Coding

/** 当归档成功时会发出一条通知 */
NSString *const SQObjectArchiverNotification = @"SQObjectArchiverNotification";
/**
 *  将对象解归档
 *  @param fileName 解归档的源文件
 */
- (instancetype)sq_unarchiverFrom:(NSString *)fileName {
    return nil;
}
/**
 *  将对象归档
 *  @param fileName 解归档的目的文件
 *  @return 归档成功与否
 */
- (BOOL)sq_archiverTo:(NSString *)fileName {
    return NO;
}
/**
 *  去除不需要归档的属性
 */
- (NSArray<NSString *> *)sq_weedCodingKeys {
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self init]) {
    
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
