//
//  UILabel+SQExtension.m
//  Pods
//
//  Created by wsong on 2017/6/26.
//
//

#import <objc/runtime.h>
#import "UILabel+SQExtension.h"

@interface SQLabelAttribute ()

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *color;

@end

@implementation SQLabelAttribute

/** 设置修改的是字体 */
+ (instancetype)attribWithFont:(UIFont *)font {
    
    SQLabelAttribute *attribute = [[SQLabelAttribute alloc] init];
    
    attribute.font = font;
    return attribute;
}
/** 设置修改的是颜色 */
+ (instancetype)attribWithColor:(UIColor *)color {
    
    SQLabelAttribute *attribute = [[SQLabelAttribute alloc] init];
    
    attribute.color = color;
    return attribute;
}
/** 设置的是字体和颜色 */
+ (instancetype)attribWithFont:(UIFont *)font color:(UIColor *)color {
    
    SQLabelAttribute *attribute = [[SQLabelAttribute alloc] init];
    
    attribute.font = font;
    attribute.color = color;
    return attribute;
}

@end

@interface UILabel ()

@property (nonatomic, strong) NSMutableAttributedString *sq_attrs;

@end

static void *kLabelAttributesKey;

@implementation UILabel (SQExtension)

/** 根据指定范围给label追加一个属性 */
- (void)sq_appendAttribute:(SQLabelAttribute *)attribute range:(NSRange)range {
    
    if (range.length == 0) return;
    
    NSMutableDictionary<NSString *, id> *attribs = [NSMutableDictionary dictionary];
    
    [attribs setValue:attribute.font forKey:NSFontAttributeName];
    [attribs setValue:attribute.color forKey:NSForegroundColorAttributeName];
    [self.sq_attrs addAttributes:attribs range:range];
}
/** 根据指定文字给label追加一个属性 */
- (void)sq_appendAttribute:(SQLabelAttribute *)attribute text:(NSString *)text {
    
    if (text.length == 0) return;
    
    NSString *string = self.text;
    NSInteger loc = 0;
    
    while (true) {
        NSRange range = [string rangeOfString:text];
        if (NSNotFound == range.location) break;
        loc += range.location;
        [self sq_appendAttribute:attribute range:NSMakeRange(loc, text.length)];
        loc += text.length;
        string = [self.text substringFromIndex:loc];
    }
}
/** 提交属性进行生效 */
- (void)sq_commit {
    self.attributedText = self.sq_attrs;
    self.sq_attrs = nil;
}

- (void)setSq_attrs:(NSMutableAttributedString *)sq_attrs {
    objc_setAssociatedObject(self, &kLabelAttributesKey, sq_attrs, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableAttributedString *)sq_attrs {
    if (objc_getAssociatedObject(self, &kLabelAttributesKey) == nil) {
        self.sq_attrs = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    return objc_getAssociatedObject(self, &kLabelAttributesKey);
}

@end
