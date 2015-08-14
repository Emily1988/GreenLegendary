//
//  CommonTools-OC.m
//  YOUSO
//
//  Created by Sean Bean on 15/5/5.
//  Copyright (c) 2015年 wn. All rights reserved.
//

#import "CommonTools-OC.h"
#import <CommonCrypto/CommonDigest.h>

#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation CommonTools_OC
/**
 *  16进制颜色(html颜色值)字符串转为UIColor
 *  @param stringToConvert 16进制色值
 *  @return
 */
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

/**
 *  将textField的前方缩进20
 *  @param textField
 *  @return
 */
+(void)changeTextFieldLeftView:(UITextField *) textField{
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(0,0,15,45)];
    leftView.backgroundColor = [UIColor clearColor];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

/**
 *  将uibutton title前方缩进且左对齐
 *  @param sender
 *  @return
 */
+(void)changeButtonIndentation:(UIButton *)sender{
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    sender.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}

/**
 *  将uiLabel title前方缩进且左对齐
 *  @param sender
 *  @return
 */
+(void)changeLabelIndentation:(UILabel *)sender{
//    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    sender.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    sender.layer.position = CGPointMake(sender.layer.position.x+20, sender.layer.position.y);
}
/**
 *  将uibutton title前方缩进5且左对齐
 *  @param sender
 *  @return
 */
+(void)changeExchangeButtonIndentation:(UIButton *)sender{
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    sender.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);

}
/**
 *  检查邮箱
 *  @param str 邮箱
 *  @return
 */
+ (BOOL)checkEmail:(NSString *)str
{
    // NSString * regex = @"^([a-z0-9A-Z]+[-|\\._]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    // NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}";
    NSString *regex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*.\\w+([-.]\\w+)*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

/**
 *  检查密码为8个以上，必须包含字母和数字
 *  @param psw 密码
 *  @return
 */
+(BOOL)checkPassWord:(NSString *)psw{
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,2000}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:psw];
    return isMatch;

}

/**
 *  检查香港手提电话为5、6、9开头的8位数字
 *  @param phone 手机号
 *  @return
 */
+(BOOL)checkMobilePhone:(NSString *)phone{
    NSString *regex = @"^(5[0-9]{7}|6[0-9]{7}|9[0-9]{7})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:phone];
    return isMatch;
    
}

+ (NSString*)getPreferredLanguage
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    
    // en:英文  zh-Hans:简体中文   zh-Hant:繁体中文
    if ([preferredLang isEqual:@"en"]) {
        return @"zh-hk";
    }
    if ([preferredLang isEqual:@"zh-Hans"]) {
        return @"zh-cn";
    }
    if ([preferredLang isEqual:@"zh-Hant"]) {
        return @"zh-hk";
    }
    return @"zh-hk";
}

//对字符串进行md5加密
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
