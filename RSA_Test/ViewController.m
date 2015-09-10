//
//  ViewController.m
//  RSA_Test
//
//  Created by xuhui on 15/9/9.
//  Copyright (c) 2015年 xuhui. All rights reserved.
//

#import "ViewController.h"

#import "NSData+Base64.h"
#import "RSAEncryptor.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    RSAEncryptor* rsaEncryptor = [[RSAEncryptor alloc] init];
    NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
    [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@"123456"];    // 这里，请换成你生成p12时的密码
    
    //公钥加密
    NSString* restrinBASE64STRING = [rsaEncryptor rsaEncryptString:@"softgoto"];
    NSLog(@"Encrypted: %@", restrinBASE64STRING);       // 请把这段字符串Copy到JAVA这边main()里做测试
    
    //私钥解密
    NSString* decryptString = [rsaEncryptor rsaDecryptString: restrinBASE64STRING];
    NSLog(@"Decrypted: %@", decryptString);
    
    
    //加签
    NSString *string = @"softgoto";
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *signData = [rsaEncryptor PKCSSignBytesSHA256withRSA:data];
    NSString* base64EncryptedString = [signData base64EncodedString];
    NSLog(@"Sign: %@", base64EncryptedString);
    
    //验签
    BOOL isOK = [rsaEncryptor PKCSVerifyBytesSHA256withRSA:data signature:signData];
    NSLog(@"Verify: %d", isOK);
    
}




@end
