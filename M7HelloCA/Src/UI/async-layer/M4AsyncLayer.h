//
//  M4AsyncLayer.h
//  M7HelloCA
//
//  Created by Chen,Meisong on 2018/3/13.
//  Copyright © 2018年 hellochenms. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@protocol M4AsyncDisplayProtocol;

@interface M4AsyncLayer : CALayer
@end

@protocol M4AsyncDisplayProtocol<NSObject>
@required
- (void)displayWithContext:(CGContextRef)context size:(CGSize)size;
@end

