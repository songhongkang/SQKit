//
//  NSJSONSerialization+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/28.
//
//

#import "NSObject+SQExtension.h"

@implementation NSJSONSerialization (SQExtension)

+ (void)load {
    
    [self sq_swizzlingClassSelector:@selector(JSONObjectWithData:options:error:)
                      otherSelector:@selector(sq_JSONObjectWithData:options:error:)];
    
    [self sq_swizzlingClassSelector:@selector(JSONObjectWithStream:options:error:)
                      otherSelector:@selector(sq_JSONObjectWithStream:options:error:)];
}

+ (id)sq_JSONObjectWithData:(NSData *)data
                    options:(NSJSONReadingOptions)opt
                      error:(NSError **)error {
    return [self p_sq_weedNilFor:[self sq_JSONObjectWithData:data options:opt error:error]];
}

+ (id)sq_JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError **)error {
    return [self p_sq_weedNilFor:[self sq_JSONObjectWithStream:stream options:opt error:error]];
}

+ (id)p_sq_weedNilFor:(id)value {
    
    if (!value || [value isKindOfClass:[NSNull class]]) {
        return nil;
    } else if ([value isKindOfClass:[NSDictionary class]] ||
               [value isKindOfClass:[NSMutableDictionary class]]) {
        
        NSMutableDictionary *md = [value isKindOfClass:[NSDictionary class]]? [NSMutableDictionary dictionaryWithDictionary:value]: (NSMutableDictionary *)value;
        NSArray *keys = md.allKeys;
        
        for (id key in keys) {
            md[key] = [self p_sq_weedNilFor:md[key]];
        }
        return md;
    } else if ([value isKindOfClass:[NSArray class]] ||
               [value isKindOfClass:[NSMutableArray class]]) {
        
        NSMutableArray *ma = [value isKindOfClass:[NSArray class]]? [NSMutableArray arrayWithArray:value]: (NSMutableArray *)value;
        
        for (NSInteger i = 0; i < ma.count; i++) {
            
            id obj = [self p_sq_weedNilFor:ma[i]];
            
            if (obj) {
                ma[i] = obj;
            } else {
                [ma removeObjectAtIndex:i];
                i--;
            }
        }
        return ma;
    }
    return value;
}

@end
