//
//  NSTimer+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import "NSTimer+SQExtension.h"

@implementation NSTimer (SQExtension)

/**
 *  避免循环引用推荐使用该方法创建NSTimer
 *  @param inerval  block触发的间隔时间
 *  @param repeats  是否需要重复触发block
 *  @param block    定时执行的block
 */
+ (NSTimer *)sq_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(NSTimer *timer))block {
    
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(p_sq_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)p_sq_blockInvoke:(NSTimer *)timer {
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
