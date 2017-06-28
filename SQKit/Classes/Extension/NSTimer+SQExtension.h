//
//  NSTimer+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <Foundation/Foundation.h>

@interface NSTimer (SQExtension)

/**
 *  避免循环引用推荐使用该方法创建NSTimer
 *  @param inerval  block触发的间隔时间
 *  @param repeats  是否需要重复触发block
 *  @param block    定时执行的block
 */
+ (NSTimer *)sq_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(NSTimer *timer))block;

@end
