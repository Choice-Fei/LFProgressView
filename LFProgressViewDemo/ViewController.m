//
//  ViewController.m
//  LFProgressViewDemo
//
//  Created by liufei on 2018/4/22.
//  Copyright © 2018年 liufei. All rights reserved.
//

#import "ViewController.h"
#import "LFProgressView/LFProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LFProgressView *progressView1 = [[LFProgressView alloc] initWithFrame:CGRectMake(75, 100, 200, 200)];
    progressView1.progressViewType = LFProgressViewTypeHorizontal;
    progressView1.progress = 1.0;

    [self.view addSubview:progressView1];
    
    LFProgressView *progressView2 = [[LFProgressView alloc] initWithFrame:CGRectMake(75, 300, 200, 200)];
    progressView2.progressViewType = LFProgressViewTypeCircle;
    progressView2.progress = 1.0;
    [self.view addSubview:progressView2];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
