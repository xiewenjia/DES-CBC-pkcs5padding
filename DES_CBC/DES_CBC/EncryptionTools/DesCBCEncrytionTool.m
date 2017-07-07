//
//  DesCBCEncrytionTool.m
//  DES_CBC
//
//  Created by xwj on 2017/7/7.
//  Copyright © 2017年 xwj. All rights reserved.
//

#import "DesCBCEncrytionTool.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation DesCBCEncrytionTool




- (NSString *)encryptUseDES_CBC_Type:(NSString *)toBeEncrypedString key:(NSString *)key{
	//CBC方式
	NSData *textData = [toBeEncrypedString dataUsingEncoding:NSUTF8StringEncoding];
	NSUInteger dataLength = [textData length];
	unsigned char buffer[1024 * 16];
	memset(buffer, 0, sizeof(char));
	size_t numBytesEncrypted = 0;
	
	//设置偏移量
	const void *iv = (const void *)[key UTF8String];
	
	CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
										  kCCOptionPKCS7Padding,
										  [key UTF8String], kCCKeySizeDES,
										  iv,
										  [textData bytes], dataLength,
										  buffer, 1024 * 16,
										  &numBytesEncrypted);
	NSString * encryptString = nil;
	if (cryptStatus == kCCSuccess) {
		NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
		//可以将data转换base64 或者 16进制等
		
	}
	return encryptString;
}

- (NSString*)decryptUseDES_CBC_Type:(NSString*)toBeDecryptedString key:(NSString*)key{

	toBeDecryptedString = [toBeDecryptedString stringByReplacingOccurrencesOfString:@" " withString:@""];
	NSMutableData *commandToSend= [[NSMutableData alloc] init];
	//将encryptString转成data 然后 将data 解码
	
	/*
	 //16进制解码
	unsigned char whole_byte;
	char byte_chars[3] = {'\0','\0','\0'};
	int i;
	for (i=0; i < [encryptString length]/2; i++) {
		byte_chars[0] = [encryptString characterAtIndex:i*2];
		byte_chars[1] = [encryptString characterAtIndex:i*2+1];
		whole_byte = strtol(byte_chars, NULL, 16);
		[commandToSend appendBytes:&whole_byte length:1];
	}
	 */
	
	unsigned char buffer[1024];
	memset(buffer, 0, sizeof(char));
	//偏移量
	const void *iv = (const void *)[key UTF8String];
	
	size_t numBytesDecrypted = 0;
	CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
										  kCCOptionPKCS7Padding,
										  [key UTF8String], kCCKeySizeDES,
										  iv,
										  [commandToSend bytes], [commandToSend length],
										  buffer, 1024,
										  &numBytesDecrypted);
	NSString *deEncryptString = nil;

	if(cryptStatus == kCCSuccess) {
		NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
		deEncryptString = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
	}
	return deEncryptString;
	
}

@end
