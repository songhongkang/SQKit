//
//  NSNull+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import "NSNull+SQExtension.h"

@implementation NSNull (SQExtension)

/**
 *  判断obj是否为nil
 *  @param obj  被判断的对象
 *  @return 如果为nil返回YES, 则反
 */
+ (BOOL)sq_isNil:(id)obj {
    return obj == nil;
}
/**
 *  判断obj是否为NSNull
 *  @param obj  被判断的对象
 *  @return 如果为NSNull返回YES, 则反
 */
+ (BOOL)sq_isNull:(id)obj {
    return [obj isKindOfClass:self];
}

@end
