//
//  ViewController.m
//  YDActivityIndicator
//
//  Created by yellowdavid on 2017/3/16.
//  Copyright © 2017年 yellowdavid. All rights reserved.
//

#import "ViewController.h"
#import "YDActivityIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YDActivityIndicatorView *aiv = [[YDActivityIndicatorView alloc] initWithFrame:CGRectMake(50, 50, 60, 60)];
    [self.view addSubview:aiv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
