//
//  NSString+TripleDES.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/28.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "NSString+TripleDES.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"

#define encryKey @""
#define encryValue @""
#define kSecrectKeyLength 24

@implementation NSString (TripleDES)

+ (NSString *)encrypt:(NSString *)plainText withKey:(NSString *)key {
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:cstr length:key.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(keyData.bytes, (CC_LONG)keyData.length, digest);
    uint8_t keyByte[kSecrectKeyLength];
    for (int i = 0; i < 16; i ++) {
        keyByte[i] = digest[i];
    }
    for (int i = 0; i < 8; i ++) {
        keyByte[16 + i] = digest[i];
    }
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vpLainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t moveBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) keyByte;
    const void *vinitVec = (const void *) [encryValue UTF8String];
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vpLainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &moveBytes);
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)moveBytes];
    NSString *result = [GTMBase64 stringByEncodingData:myData];
    return result;
}

+ (NSString*)decrypt:(NSString*)encryptText withKey:(NSString*)key{
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:key.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    uint8_t keyByte[kSecrectKeyLength];
    for (int i=0; i<16; i++) {
        keyByte[i] = digest[i];
    }
    for (int i=0; i<8; i++) {
        keyByte[16+i] = digest[i];
    }
    NSData *encryptData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    const void *vkey = (const void *) keyByte;
    const void *vinitVec = (const void *) [encryValue UTF8String];
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                      length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    return result;
}

- (NSString*) sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];
    return output;
}

@end
