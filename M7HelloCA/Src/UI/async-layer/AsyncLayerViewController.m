//
//  AsyncLayerViewController.m
//  M7HelloCA
//
//  Created by Chen,Meisong on 2018/3/13.
//  Copyright © 2018年 hellochenms. All rights reserved.
//

#import "AsyncLayerViewController.h"
#import "DrawView.h"

@interface AsyncLayerViewController ()
@property (nonatomic) DrawView *drawView;
@end

@implementation AsyncLayerViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.drawView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.drawView.frame = CGRectMake(20, 100, 100, 200);
    [self.drawView.layer setNeedsDisplay];
}

#pragma mark - Getter
- (DrawView *)drawView {
    if(!_drawView) {
        _drawView = [DrawView new];
    }

    return _drawView;
}

@end
