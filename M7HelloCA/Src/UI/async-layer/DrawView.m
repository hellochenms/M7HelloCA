//
//  DrawView.m
//  M7HelloCA
//
//  Created by Chen,Meisong on 2018/3/13.
//  Copyright © 2018年 hellochenms. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
#pragma mark - Life Cycle
+ (Class)layerClass {
    return [M4AsyncLayer class];
}

#pragma mark - M4AsyncDisplayProtocol
- (void)displayWithContext:(CGContextRef)context size:(CGSize)size {
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    for (NSInteger i = 0; i < 50000; i++) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGFloat radius = MIN(size.width / 2, size.height / 2);
        CGPathAddArc(path, NULL, size.width / 2, size.height / 2, radius, 0, M_PI * 2, 0);
        CGContextAddPath(context, path);
        CGPathRelease(path);
        CGContextFillPath(context);
    }
    
    CGContextRestoreGState(context);
}

@end
