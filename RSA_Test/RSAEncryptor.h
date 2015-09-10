//
//  RSAEncryptor.h
//  RSA_Test
//
//  Created by xuhui on 15/9/9.
//  Copyright (c) 2015年 xuhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAEncryptor : NSObject

#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;
-(void) loadPublicKeyFromData: (NSData*) derData;

-(void) loadPrivateKeyFromFile: (NSString*) p12FilePath password:(NSString*)p12Password;
-(void) loadPrivateKeyFromData: (NSData*) p12Data password:(NSString*)p12Password;

-(SecKeyRef) getPublicKey;
-(SecKeyRef) getPrivateKey;


-(NSString*) rsaEncryptString:(NSString*)string;
-(NSData*) rsaEncryptData:(NSData*)data ;


-(NSString*) rsaDecryptString:(NSString*)string;
-(NSData*) rsaDecryptData:(NSData*)data;

-(NSData *)PKCSSignBytesSHA256withRSA:(NSData*)plainData;
-(BOOL)PKCSVerifyBytesSHA256withRSA:(NSData *)plainData signature:(NSData *)signature;



#pragma mark - Class Methods

+(void) setSharedInstance: (RSAEncryptor*)instance;
+(RSAEncryptor*) sharedInstance;

@end
