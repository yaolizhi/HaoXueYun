//
//  XHNetWorkConfig.h
//  daycareParent
//
//  Created by Git on 2017/11/27.
//  Copyright © 2017年 XueHui. All rights reserved.
//


typedef NS_ENUM(NSInteger,XHNetWorkOption)
{
    XHNetWorkOptionService = 0,   //!< service Url  默认选项
    XHNetWorkOptionSetService = 1,   //!< service Url  设置选项
};

#define NetWorkType 1  //!< 0 为线下 1为线上

#if  NetWorkType

#define ServiceBaseUrl @"http://api.hxcloud.ixuehui.cn/"


#define RONGCLOUD_IM_APPKEY @"82hegw5u820xx"

#define SERVICE_ID @"KEFU153049757096530"

#else


#define ServiceBaseUrl @"http://47.93.115.228:9002/" //@"http://192.168.1.148:8080/" //
//#define ServiceBaseUrl @"http://192.168.1.143:8080/"//海燕

#define RONGCLOUD_IM_APPKEY @"8w7jv4qb8wt3y"

#define SERVICE_ID @"KEFU152999660068261"


#endif


#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef  void (^NetWorkSucessBlock) (id object,BOOL verifyObject);

typedef  void (^NetWorkErrorBlock) (NSError *error);

typedef void (^NetWorkConstructingBodyWithBlock) (id <AFMultipartFormData> formData);

typedef void (^NetWorkProgressWithBlock) (NSProgress *uploadProgress);




@interface XHNetWorkConfig : AFHTTPSessionManager

@property (nonatomic,assign) XHNetWorkOption option; //!< 选项








/**
 单例初始化方法
 
 @return 单例对象
 */
+ (instancetype)sharedNetWork;


/**
 key
 
 @param paramDictionary 参数字典
 */
-(void)setParam:(NSDictionary*)paramDictionary;



-(void)setObject:(NSString*)object forKey:(NSString*)key;



-(void)setIdObject:(id)object forKey:(NSString*)key;
/**
 key

 @param key key
 */
-(void)removeObjectForKey:(NSString*)key;

/**
 key
@param key key
*/
-(id)objectForKey:(NSString*)key;


#pragma mark GET方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回掉
 @param errorBlock  失败回调
 */
- (void)getWithUrl:(NSString *)url
            sucess:(NetWorkSucessBlock)sucessBlock
             error:(NetWorkErrorBlock)errorBlock;




#pragma mark 未解析GET方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回掉
 @param errorBlock  失败回调
 */
- (void)getUnAnalyzingWithUrl:(NSString *)url
            sucess:(NetWorkSucessBlock)sucessBlock
             error:(NetWorkErrorBlock)errorBlock;




#pragma mark POST方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postWithUrl:(NSString *)url
             sucess:(NetWorkSucessBlock)sucessBlock
              error:(NetWorkErrorBlock)errorBlock;


#pragma mark 标准的POST请求
- (void)postNormativeWithUrl:(NSString *)url
                      sucess:(NetWorkSucessBlock)sucessBlock
                       error:(NetWorkErrorBlock)errorBlock;

#pragma mark 获取QQ的Unionid的POST方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回调
 @param errorBlock  失败回调un，
 */
- (void)postQQUnionidWithUrl:(NSString *)url
                      sucess:(NetWorkSucessBlock)sucessBlock
                       error:(NetWorkErrorBlock)errorBlock;


#pragma mark 未解析POST方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postUnAnalyzingWithUrl:(NSString *)url
             sucess:(NetWorkSucessBlock)sucessBlock
              error:(NetWorkErrorBlock)errorBlock;

#pragma mark POST方法表单网络请求
/**
 @param url 接口后缀url地址
 @param constructingBodyWithBlock 表单回调
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postFormDataObjectWithUrl:(NSString *)url
                          constructingBodyWithBlock:(NetWorkConstructingBodyWithBlock)constructingBodyWithBlock
                                             sucess:(NetWorkSucessBlock)sucessBlock
                                              error:(NetWorkErrorBlock)errorBlock;



#pragma mark POST方法进度网络请求
/**
 @param url 接口后缀url地址
 @param constructingBodyWithBlock 表单回调
 @param progressWithBlock 进度回调
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postProgressWithUrl:(NSString *)url
        constructingBodyWithBlock:(NetWorkConstructingBodyWithBlock)constructingBodyWithBlock
                   progress:(NetWorkProgressWithBlock)progressWithBlock
                           sucess:(NetWorkSucessBlock)sucessBlock
                            error:(NetWorkErrorBlock)errorBlock;






@end
