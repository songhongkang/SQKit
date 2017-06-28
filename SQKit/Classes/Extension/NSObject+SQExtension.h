//
//  NSObject+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (SQExtension) <NSCopying, NSCoding>

/** 类名 */
@property (class, nonatomic, copy, readonly) NSString *sq_name;
/** 类名 */
@property (nonatomic, copy, readonly) NSString *sq_name;

#pragma mark - Runtime
/**
 *  遍历成员属性
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
- (void)sq_enumerateKeysAndObjectsBackwardClass:(Class)class
                                          block:(void (^)(NSString *key, id obj, BOOL *stop))block;
/**
 *  遍历对象方法
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
- (void)sq_enumerateSelectorsBackwardClass:(Class)class block:(void (^)(SEL sel, BOOL *stop))block;

/**
 *  遍历类方法
 *  @param class    遍历追溯的目标类
 *  @param block    每遍历到一个属性block被回调, *stop = YES, 停止遍历
 *
 */
+ (void)sq_enumerateSelectorsBackwardClass:(Class)class block:(void (^)(SEL sel, BOOL *stop))block;

/**
 *  遍历runtime中的类
 *  @param block    每遍历到一个类block被回调, *stop = YES, 停止遍历
 *
 */
+ (void)sq_enumerateClassListUsingBlock:(void (^)(Class class, BOOL *stop))block;

/**
 *  交换两个类方法实现
 */
+ (void)sq_swizzlingClassSelector:(SEL)sel otherSelector:(SEL)otherSel;

/**
 *  交换两个实例方法实现
 */
+ (void)sq_swizzlingInstanceSelector:(SEL)sel otherSelector:(SEL)otherSel;


#pragma mark - Copying
/**
 *  拷贝一个新的对象
 */
- (instancetype)sq_copy;
/**
 *  去除不需要拷贝的属性
 */
- (NSArray<NSString *> *)sq_weedCopyKeys;


#pragma mark - Coding

/** 当归档成功时会发出一条通知 */
UIKIT_EXTERN NSString *const SQObjectArchiverNotification;

/**
 *  将对象解归档
 *  @param fileName 解归档的源文件
 */
- (instancetype)sq_unarchiverFrom:(NSString *)fileName;
/**
 *  将对象归档
 *  @param fileName 解归档的目的文件
 *  @return 归档成功与否
 */
- (BOOL)sq_archiverTo:(NSString *)fileName;
/**
 *  去除不需要归档的属性
 */
- (NSArray<NSString *> *)sq_weedCodingKeys;


@end
