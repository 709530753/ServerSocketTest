//
//  Person.m
//  ServerSocketTest
//
//  Created by myxc on 2018/6/20.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "Person.h"

@implementation Person


//或者精确点，但需要根据运营商更新
- (BOOL)wl_isMobileNumberClassification {
    /**
     * 手机号码
     NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\\\d|705)\\\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17
     */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\\\d|709)\\\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22
     NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

     */
    NSString * CT = @"^1((33|53|8[09])\\\\d|349|700)\\\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28
     */
    NSString * PHS = @"^0(10|2[0-5789]|\\\\d{3})\\\\d{7,8}$";
    
    if (([self isValidateByRegex:CM])
        || ([self isValidateByRegex:CU])
        || ([self isValidateByRegex:CT])
        || ([self isValidateByRegex:PHS])) {
        return YES;
    }else {
        return NO;
    }
}

- (BOOL)isValidUrlsfsfs{
    NSString * regex = @"\\\\b((ftp|http|https?):\\\\/\\\\/[-\\\\w]+(\\\\.\\\\w[-\\\\w]*)+|(?i:[a-z0-9](?:[-a-z0-9]*[a-z0-9])?\\\\.)+(?-i:com\\\\b|edu\\\\b|biz\\\\b|gov\\\\b|in(?:t|fo)\\\\b|mil\\\\b|net\\\\b|org\\\\b|[a-z][a-z]\\\\b))(:\\\\d+)?(/[^.!,?;\\";
    return [self isValidateByRegex:regex];
}

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
{
    NSString *hanzi = containChinese ? @"\\u4e00-\\u9fa5" : @"";
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    NSString *first = firstCannotBeDigtal ? @"^[a-zA-Z_]" : @"";
    NSString *lengthRegex = [NSString stringWithFormat:@"(?=^.{%@,%@}$)", @(minLenth), @(maxLenth)];
    NSString *digtalRegex = containDigtal ? @"(?=(.*\\\\d.*){1})" : @"";
    NSString *letterRegex = containLetter ? @"(?=(.*[a-zA-Z].*){1})" : @"";
    NSString *characterRegex = [NSString stringWithFormat:@"(?:%@[%@A-Za-z0-9%@]+)", first, hanzi, containOtherCharacter ? containOtherCharacter : @""];
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    NSString *regex = [NSString stringWithFormat:@"%@%@%@%@", lengthRegex, digtalRegex, letterRegex, characterRegex];
    return [self isValidateByRegex:regex];
}


- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

- (BOOL)isValidUrl {
    NSString * regex = @"\\\\b((ftp|http|https?):\\\\/\\\\/[-\\\\w]+(\\\\.\\\\w[-\\\\w]*)+|(?i:[a-z0-9](?:[-a-z0-9]*[a-z0-9])?\\\\.)+(?-i:com\\\\b|edu\\\\b|biz\\\\b|gov\\\\b|in(?:t|fo)\\\\b|mil\\\\b|net\\\\b|org\\\\b|[a-z][a-z]\\\\b))(:\\\\d+)?(/[^.!,?;\\ionvrbnotrinoprenionribrijkngrgtgoirehopghpojp[rjgoprhj59j";
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    return [self isValidateByRegex:regex];
}

- (BOOL)simpleVerifyIdentityCardNum {
    NSString *regex2 = @"^(\\\\d{14}|\\\\d{17})(\\\\d|[xX])$";
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    return [self isValidateByRegex:regex2];
}

- (BOOL)isValidPassword {
    //以字母开头，只能包含“字母”，“数字”，“下划线”，长度6~18
    NSString *regex = @"^([a-zA-Z]|[a-zA-Z0-9_]|[0-9]){6,18}$";
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    return [self isValidateByRegex:regex];
}

- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";

    return [pre evaluateWithObject:self];
}


@end
