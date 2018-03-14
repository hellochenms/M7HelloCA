//
//  ViewController.m
//  M7HelloCA
//
//  Created by Chen,Meisong on 2018/3/13.
//  Copyright © 2018年 hellochenms. All rights reserved.
//

#import "ViewController.h"
#import "AsyncLayerViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *datas;
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"  forIndexPath:indexPath];
    NSArray *data = self.datas[indexPath.row];
    cell.textLabel.text = data[0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data = self.datas[indexPath.row];
    UIViewController *viewController = [data[1] new];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Getter
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    
    return _tableView;
}

- (NSArray *)datas {
    if(!_datas) {
        _datas = @[@[@"AsyncLayer", [AsyncLayerViewController class]],
                   ];
    }

    return _datas;
}

@end
