//
//  DesCBCEncrytionTool.h
//  DES_CBC
//
//  Created by xwj on 2017/7/7.
//  Copyright © 2017年 xwj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesCBCEncrytionTool : NSObject

+ (instancetype)shareManager;

/*
 * DES/CBC/PKCS5Padding加密
 *toBeEncrypedString要加密的文字
 *key 加密的密钥 加密偏移量设置
 *如果偏移量和key不相同 另加一个参数就可以
 */

- (NSString *)encryptUseDES_CBC_Type:(NSString *)toBeEncrypedString key:(NSString *)key;


/*
 * DES/CBC/PKCS5Padding解密
 *toBeDecryptedString要解密密的文字
 * key 解密密的密钥 解密偏移量设置
 * 如果偏移量和key不相同 另加一个参数就可以
 */
- (NSString*)decryptUseDES_CBC_Type:(NSString*)toBeDecryptedString key:(NSString*)key;


@end
