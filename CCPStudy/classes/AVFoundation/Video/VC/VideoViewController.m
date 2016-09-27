//
//  VideoViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoVM.h"
#import "StartButton.h"

@interface VideoViewController ()
@property (nonatomic,strong) NSString *a;
@property (nonatomic,strong) VideoVM *vm;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavWithTitle:@"Video" andBackColor:RGBA(189, 191, 223, 1.0)];
    [self createStartButton];
    [self createPreView];
}

- (void)createPreView {
    self.vm = [[VideoVM alloc] init];
    AVCaptureVideoPreviewLayer *preLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.vm.session];
    preLayer.backgroundColor = [UIColor redColor].CGColor;
    preLayer.frame = CGRectMake(-100, 64, Main_width * 2, 300);
    [self.view.layer addSublayer:preLayer];
}

- (void)createStartButton {
    StartButton *btn = [[StartButton alloc] initWithFrame:CGRectMake(Main_width / 2 - 25, 380, 50, 50)];
    [self.view addSubview:btn];
    WS(ws);
    [RACObserve(btn, selected) subscribeNext:^(id x) {
        if ([ws.a isEqualToString:@"a"]) {
            if ([x isEqual:@(1)]) {
                [self.vm.session startRunning];
                [btn removeSub];
                self.vm.delegate = (id<AVCaptureFileOutputRecordingDelegate>)self;
                [btn normalLayer];
            }
            else {
                if ([self.vm.output isRecording]) {
                    [btn removeSub];
                    [self.vm.output stopRecording];
                    [btn selectedLayer];
                }
            }
        }
        else {
            ws.a = @"a";
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
