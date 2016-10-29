//
//  J_MD5.m
//  JKit
//
//  Created by Jacky on 16/10/29.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "J_MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation J_MD5

+(NSString *)J_md5:(NSString *)string{
    if (string == nil || [string length] == 0) {
        return nil;
    }

    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    
    return [ms copy];
}

@end
