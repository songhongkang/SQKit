//
//  UITextField+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (SQExtension)

/** 限制小数位数 */
- (void)sq_setDecimalLimitCount:(NSUInteger)limitCount
                textChangeBlock:(void (^)(UITextField *textField))textChangeBlock;
/** 金额格式 */
- (void)sq_setPriceLimitTextChangeBlock:(void (^)(UITextField *textField))textChangeBlock;
/** 限制字符长度 */
- (void)sq_setCharLimitCount:(NSUInteger)limitCount
             textChangeBlock:(void (^)(UITextField *textField))textChangeBlock;;
/** 手机号格式 */
- (void)sq_setTelTextChangeBlock:(void (^)(UITextField *textField))textChangeBlock;

@end
