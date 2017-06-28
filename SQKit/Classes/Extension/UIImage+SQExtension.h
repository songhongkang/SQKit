//
//  UIImage+SQExtension.h
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (SQExtension)

/**
 *  根据颜色生成图片
 *  @param  color   生成图片的颜色
 */
+ (instancetype)sq_imageWithColor:(UIColor *)color;
/**
 *  根据颜色生成指定大小图片
 *  @param  color   生成图片的颜色
 *  @param  size    生成的图片大小
 */
+ (instancetype)sq_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
