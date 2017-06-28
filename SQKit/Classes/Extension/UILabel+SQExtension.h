//
//  UILabel+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

@interface SQLabelAttribute : NSObject

/** 设置修改的是字体 */
+ (instancetype)attribWithFont:(UIFont *)font;
/** 设置修改的是颜色 */
+ (instancetype)attribWithColor:(UIColor *)color;
/** 设置的是字体和颜色 */
+ (instancetype)attribWithFont:(UIFont *)font color:(UIColor *)color;

@end

@interface UILabel (SQExtension)

/** 根据指定范围给label追加一个属性 */
- (void)sq_appendAttribute:(SQLabelAttribute *)attribute range:(NSRange)range;
/** 根据指定文字给label追加一个属性 */
- (void)sq_appendAttribute:(SQLabelAttribute *)attribute text:(NSString *)text;
/** 提交属性进行生效 */
- (void)sq_commit;

@end
