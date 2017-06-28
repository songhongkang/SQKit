//
//  UIButton+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <objc/runtime.h>
#import "UIButton+SQExtension.h"
#import "UIImage+SQExtension.h"


@implementation UIButton (SQExtension)

#pragma mark - 便利的属性设置方法
/** 普通状态显示的文本 */
- (void)setSq_normalStateTitle:(NSString *)sq_normalStateTitle {
    [self setTitle:sq_normalStateTitle forState:UIControlStateNormal];
}
- (NSString *)sq_normalStateTitle {
    return [self titleForState:UIControlStateNormal];
}

/** 高亮状态显示的文本 */
- (void)setSq_highlightedStateTitle:(NSString *)sq_highlightedStateTitle {
    [self setTitle:sq_highlightedStateTitle forState:UIControlStateHighlighted];
}
- (NSString *)sq_highlightedStateTitle {
    return [self titleForState:UIControlStateHighlighted];
}
/** 不可用状态显示的文本 */
- (void)setSq_disabledStateTitle:(NSString *)sq_disabledStateTitle {
    [self setTitle:sq_disabledStateTitle forState:UIControlStateDisabled];
}
- (NSString *)sq_disabledStateTitle {
    return [self titleForState:UIControlStateDisabled];
}
/** 普通状态显示的文本颜色 */
- (void)setSq_normalStateTitleColor:(UIColor *)sq_normalStateTitleColor {
    [self setTitleColor:sq_normalStateTitleColor forState:UIControlStateNormal];
}
- (UIColor *)sq_normalStateTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}
/** 高亮状态显示的文本颜色 */
- (void)setSq_highlightedStateTitleColor:(UIColor *)sq_highlightedStateTitleColor {
    [self setTitleColor:sq_highlightedStateTitleColor forState:UIControlStateHighlighted];
}
- (UIColor *)sq_highlightedStateTitleColor {
    return [self titleColorForState:UIControlStateHighlighted];
}
/** 不可用状态显示的文本颜色 */
- (void)setSq_disabledStateTitleColor:(UIColor *)sq_disabledStateTitleColor {
    [self setTitleColor:sq_disabledStateTitleColor forState:UIControlStateDisabled];
}
- (UIColor *)sq_disabledStateTitleColor {
    return [self titleColorForState:UIControlStateDisabled];
}
/** 普通状态显示的背景颜色 */
- (void)sq_setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage sq_imageWithColor:color] forState:state];
}

/** 字体 */
- (void)setSq_font:(UIFont *)sq_font {
    self.titleLabel.font = sq_font;
}
- (UIFont *)sq_font {
    return self.titleLabel.font;
}

#pragma mark - 事件

static void *kClickHandlerKey;

/** 点击事回调 */
- (void)setSq_clickHandler:(void (^)(UIButton *button))clickHandler {
    objc_setAssociatedObject(self, &kClickHandlerKey, clickHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))sq_clickHandler {
    return objc_getAssociatedObject(self, &kClickHandlerKey);
}

@end
