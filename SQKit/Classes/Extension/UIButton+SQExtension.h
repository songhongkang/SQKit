//
//  UIButton+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (SQExtension)

#pragma mark - 便利的属性设置方法
/** 普通状态显示的文本 */
@property (nonatomic, copy) NSString *sq_normalStateTitle;
/** 高亮状态显示的文本 */
@property (nonatomic, copy) NSString *sq_highlightedStateTitle;
/** 不可用状态显示的文本 */
@property (nonatomic, copy) NSString *sq_disabledStateTitle;

/** 普通状态显示的文本颜色 */
@property (nonatomic, strong) UIColor *sq_normalStateTitleColor;
/** 高亮状态显示的文本颜色 */
@property (nonatomic, strong) UIColor *sq_highlightedStateTitleColor;
/** 不可用状态显示的文本颜色 */
@property (nonatomic, strong) UIColor *sq_disabledStateTitleColor;

/** 字体 */
@property (nonatomic, strong) UIFont *sq_font;

#pragma mark - 事件
/** 点击事回调 */
@property (nonatomic, copy) void (^sq_clickHandler)(UIButton *button);


#pragma mark - 方法
/** 设置按钮背景颜色 */
- (void)sq_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
