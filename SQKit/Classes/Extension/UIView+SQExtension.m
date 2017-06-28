//
//  UIView+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import "UIView+SQExtension.h"

@implementation UIView (SQExtension)

- (void)setSq_cornerRadius:(CGFloat)sq_cornerRadius {
    self.layer.cornerRadius = sq_cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)sq_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setSq_borderWidth:(CGFloat)sq_borderWidth {
    self.layer.borderWidth = sq_borderWidth;
}

- (CGFloat)sq_borderWidth {
    return self.layer.borderWidth;
}

- (void)setSq_borderColor:(UIColor *)sq_borderColor {
    self.layer.borderColor = sq_borderColor.CGColor;
}

- (UIColor *)sq_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (UIViewController *)sq_viewController {
    return nil;
}

- (void)sq_addDividerWithWidth:(CGFloat)width
                         color:(UIColor *)color
                   orientation:(SQViewOrientation)orientation
               leftOrTopMargin:(CGFloat)leftOrTopMargin
           rightOrBottomMargin:(CGFloat)rightOrBottomMargin {
    
}

@end
