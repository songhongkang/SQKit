//
//  NSString+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import "NSString+SQExtension.h"

@implementation NSString (SQExtension)

- (BOOL)sq_isEmpty {
    return self.length == 0;
}

/**
 *  通过SEL数据创建一个字符串
 *  @param  selector    选择器
 *  @return selector的名字
 */
+ (instancetype)sq_stringWithSel:(SEL)selector {
    return NSStringFromSelector(selector);
}
/**
 *  通过类对象创建一个字符串
 *  @param  class   类对象
 *  @return class的名字
 */
+ (instancetype)sq_stringWithClass:(Class)class {
    return NSStringFromClass(class);
}

/** 是否是一个setter方法串 */
- (BOOL)sq_isSetter {
    return NO;
}
/** 是否是一个getter方法串 */
- (BOOL)sq_isGetter {
    return NO;
}
/** 是否是一个纯数字的字符串 */
- (BOOL)sq_isPureNumandCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]].length == 0;
}

@end
