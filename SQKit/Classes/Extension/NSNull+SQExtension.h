//
//  NSNull+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <Foundation/Foundation.h>

@interface NSNull (SQExtension)

/**
 *  判断obj是否为nil
 *  @param obj  被判断的对象
 *  @return 如果为nil返回YES, 则反
 */
+ (BOOL)sq_isNil:(id)obj;
/**
 *  判断obj是否为NSNull
 *  @param obj  被判断的对象
 *  @return 如果为NSNull返回YES, 则反
 */
+ (BOOL)sq_isNull:(id)obj;

@end
