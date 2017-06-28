//
//  NSUserDefaults+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import "NSUserDefaults+SQExtension.h"
#import "NSString+SQExtension.h"

NSString *const SQUserDefaultsSyncSuccessNotification = @"SQUserDefaultsSyncSuccessNotification";

@implementation NSUserDefaults (SQExtension)

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSString *selName = [NSString sq_stringWithSel:sel];
    
    if ([selName sq_isSetter]) {
        
        return YES;
    } else if ([selName sq_isGetter]) {
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
