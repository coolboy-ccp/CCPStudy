//
//  VideoVM.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/27.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "VideoVM.h"

@implementation VideoVM

- (instancetype)init {
    if ([super init]) {
        [self initDevices];
    }
    return self;
}

- (void)initDevices {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:[devices firstObject] error:NULL];
    AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:NULL];
    self.output = [[AVCaptureMovieFileOutput alloc] init];

    self.session = [[AVCaptureSession alloc] init];
    if ([self.session canAddInput:videoInput]) {
        [self.session addInput:videoInput];
    }
    if ([self.session canAddInput:audioInput]) {
        [self.session addInput:audioInput];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    [RACObserve(self, delegate) subscribeNext:^(id x) {
        if (x) {
            [self saveVideoWithDelegate:x];
        }
    }];
}

- (void)saveVideoWithDelegate:(id<AVCaptureFileOutputRecordingDelegate>)delegate {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"myVideo"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.output startRecordingToOutputFileURL:url recordingDelegate:delegate];
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
    NSLog(@"finished recoding");
}

@end
