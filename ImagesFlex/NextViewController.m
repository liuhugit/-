//
//  NextViewController.m
//  toolbar
//
//  Created by 刘虎 on 16/7/16.
//  Copyright © 2016年 刘虎. All rights reserved.
//

#import "NextViewController.h"

const CGFloat ImageHeight = 200;

@interface NextViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIImageView *image;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, -(ImageHeight/2), 375, ImageHeight)];
//    _image.contentMode = UIViewContentModeScaleAspectFill;
    _image.image = [UIImage imageNamed:@"qwe.jpg"];
    [self.view addSubview:_image];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat height = scrollView.contentOffset.y;
    if (height < 0) {
        _image.frame = CGRectMake(0 + height/4, -(ImageHeight/2), 375 - height/2, ImageHeight - height);
    }else{
        if (height < ImageHeight/2 || height == ImageHeight/2) {
            self.tableView.frame = CGRectMake(0, ImageHeight/2 - height, 375, 667 - (ImageHeight/2 - height));
        }
        _image.frame = CGRectMake(0 , -(ImageHeight/2) - height, 375, ImageHeight);
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cel"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cel"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ImageHeight/2, 375, 667 - ImageHeight/2) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

@end
