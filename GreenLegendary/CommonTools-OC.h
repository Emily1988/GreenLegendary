//
//  CommonTools-OC.h
//  YOUSO
//
//  Created by Sean Bean on 15/5/5.
//  Copyright (c) 2015年 wn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommonTools_OC : NSObject
/**
 *  16进制颜色(html颜色值)字符串转为UIColor
 *  @param stringToConvert 16进制色值
 *  @return
 */
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;


/**
 *  将textField的前方缩进20
 *  @param textField
 *  @return
 */
+(void)changeTextFieldLeftView:(UITextField *) textField;


/**
*  将uibutton title前方缩进且左对齐
*  @param sender
*  @return
*/
+(void)changeButtonIndentation:(UIButton *)sender;

/**
 *  将uiLabel title前方缩进且左对齐
 *  @param sender
 *  @return
 */
+(void)changeLabelIndentation:(UILabel *)sender;

/**
 *  检查邮箱
 *  @param str 邮箱
 *  @return
 */

/**
 *  将uibutton title前方缩进5且左对齐
 *  @param sender
 *  @return
 */
+(void)changeExchangeButtonIndentation:(UIButton *)sender;

+ (BOOL)checkEmail:(NSString *)str;


/**
 *  检查密码为8个以上，必须包含字母和数字
 *  @param psw 密码
 *  @return
 */
+(BOOL)checkPassWord:(NSString *)psw;

/**
 *  检查香港手提电话为5、6、9开头的8位数字
 *  @param phone 手机号
 *  @return
 */
+(BOOL)checkMobilePhone:(NSString *)phone;

//获取当前语言
+ (NSString*)getPreferredLanguage;

+ (NSString *)md5:(NSString *)str;

@end
