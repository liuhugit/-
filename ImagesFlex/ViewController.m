//
//  ViewController.m
//  toolbar
//
//  Created by 刘虎 on 16/7/16.
//  Copyright © 2016年 刘虎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    CGFloat height;
}

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UIImageView *image;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    height = 0;
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, -400, 375, 400)];
    _image.image = [UIImage imageNamed:@"qwe.jpg"];
    _image.contentMode = UIViewContentModeScaleAspectFill;//等比例伸缩
    [self.tableView insertSubview:_image atIndex:0];//必须放在最下面，不然会把cell盖住
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"--------%f  *******%f",_image.frame.origin.y,_image.frame.size.height);
    CGFloat content = scrollView.contentOffset.y + 200;
    if (content < 0) {
        _image.frame = CGRectMake(0, -400, 375, 400 - content);
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试-%ld",indexPath.row];
    return cell;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    }
    return _tableView;
}

@end
