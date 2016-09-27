//
//  VideoVM.h
//  CCPStudy
//
//  Created by liqunfei on 16/9/27.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoVM : NSObject<AVCaptureFileOutputRecordingDelegate>
@property (nonatomic,strong) AVCaptureSession *session;
@property (nonatomic,strong) AVCaptureMovieFileOutput *output;
@property (nonatomic,weak) id<AVCaptureFileOutputRecordingDelegate>delegate;
@end
