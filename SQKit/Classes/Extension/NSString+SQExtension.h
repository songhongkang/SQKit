//
//  NSString+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <Foundation/Foundation.h>

@interface NSString (SQExtension)

@property (nonatomic, assign, readonly, getter=sq_isEmpty) BOOL sq_empty;

/**
 *  通过SEL数据创建一个字符串
 *  @param  selector    选择器
 *  @return selector的名字
 */
+ (instancetype)sq_stringWithSel:(SEL)selector;
/**
 *  通过类对象创建一个字符串
 *  @param  class   类对象
 *  @return class的名字
 */
+ (instancetype)sq_stringWithClass:(Class)class;

/** 是否是一个setter方法串 */
- (BOOL)sq_isSetter;
/** 是否是一个getter方法串 */
- (BOOL)sq_isGetter;
/** 是否是一个纯数字的字符串 */
- (BOOL)sq_isPureNumandCharacters;

@end
