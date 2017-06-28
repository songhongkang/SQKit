//
//  UIView+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

/** 视图操作的方向 */
typedef NS_ENUM(NSInteger, SQViewOrientation) {
    SQViewOrientationTop = 0,   ///< 上
    SQViewOrientationBottom,    ///< 下
    SQViewOrientationLeft,      ///< 左
    SQViewOrientationRight      ///< 右
};

@interface UIView (SQExtension)

#pragma mark - 便利的属性设置方法
/** 圆角 */
@property (nonatomic, assign) CGFloat sq_cornerRadius;
/** 边框宽度 */
@property (nonatomic, assign) CGFloat sq_borderWidth;
/** 边框颜色 */
@property(nonatomic, strong) UIColor *sq_borderColor;
/** 视图所在控制器 */
@property (nonatomic, strong, readonly) UIViewController *sq_viewController;

/**
 *  给view添加分隔线
 *  @param  width               分隔线的宽度
 *  @param  color               分隔线的颜色
 *  @param  orientation         分隔线所在视图的方位
 *  @param  leftOrTopMargin     分隔线的边距
 *  @param  rightOrBottomMargin 分隔线的边距
 */
- (void)sq_addDividerWithWidth:(CGFloat)width
                         color:(UIColor *)color
                   orientation:(SQViewOrientation)orientation
               leftOrTopMargin:(CGFloat)leftOrTopMargin
           rightOrBottomMargin:(CGFloat)rightOrBottomMargin;

@end
