//
//  M4AsyncLayer.m
//  M7HelloCA
//
//  Created by Chen,Meisong on 2018/3/13.
//  Copyright © 2018年 hellochenms. All rights reserved.
//

#import "M4AsyncLayer.h"
#import <UIKit/UIKit.h>

@interface M4AsyncLayer()
@property (nonatomic) BOOL isCanceled;
@end

@implementation M4AsyncLayer
#pragma mark - Life Cycle
- (void)display {
    __strong id<M4AsyncDisplayProtocol> delegate = (id)self.delegate;
    if (!delegate
        || ![delegate conformsToProtocol:@protocol(M4AsyncDisplayProtocol)]
        || ![delegate respondsToSelector:@selector(displayWithContext:size:)]) {
        self.contents = nil;
        
        return;
    }
    
    if (self.isCanceled) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.isCanceled) {
            return;
        }
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, self.contentsScale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [delegate displayWithContext:context size:self.bounds.size];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.isCanceled) {
                return;
            }
            
            self.contents = (id)image.CGImage;
        });
    });
}

@end
