//
//  XHNetWorkConfig.m
//  daycareParent
//
//  Created by Git on 2017/11/27.
//  Copyright © 2017年 XueHui. All rights reserved.
//










#import "XHNetWorkConfig.h"
#import "XHLoginViewController.h"



@interface XHNetWorkConfig ()

@property (nonatomic,strong) NSMutableDictionary *paramDictionary; //!< 参数字典





@end


@implementation XHNetWorkConfig

static XHNetWorkConfig *net = nil;

/**
 单例初始化方法
 
 @return 单例对象
 */
+ (instancetype)sharedNetWork
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        net = [[self alloc]init];
        
    });
    return net;
    
}


/**
 key
 
 @param paramDictionary key
 */
-(void)setParam:(NSDictionary*)paramDictionary
{
    [self.paramDictionary addEntriesFromDictionary:paramDictionary];
    NSLog(@"%@",self.paramDictionary);
}

#pragma mark - 设置字典的参数

/**
 设置参数

 @param object 参数内容
 @param key 参数的key
 */
-(void)setObject:(NSString*)object forKey:(NSString*)key
{
    [self.paramDictionary setObject:[NSString safeString:object] forKey:[NSString safeString:key]];
    
}
/**
 设置参数
 
 @param object 参数内容
 @param key 参数的key
 */
-(void)setIdObject:(id)object forKey:(NSString*)key
{
    [self.paramDictionary setObject:object forKey:[NSString safeString:key]];
    
}

-(void)removeObjectForKey:(NSString*)key
{
    [self.paramDictionary removeObjectForKey:key];
}



/**
 key
 @param key key
 */
-(id)objectForKey:(NSString*)key
{
    return [self.paramDictionary objectForKey:key];
}

/**
 验证数据请求的数据

 @param object 要解析的数据请求数据
 @return 成功与否
 */
-(BOOL)verifyResPonseObject:(NSDictionary*)object
{
    NSInteger responseCode = [[object objectForKey:@"STATE"] integerValue];
    NSString *responseMessage = [NSString safeString:[object objectForKey:@"MSG"]];
    
    
    switch (responseCode)
    {
        case 0:
        {
            return YES;
        }
            break;
        case 901:
        case 902:
        case 903:
        case 904:
        {
            XHLoginViewController *login = [[XHLoginViewController alloc]init];
            UINavigationController *rootNaV = [[UINavigationController alloc]initWithRootViewController:login];
            [kWindow setRootViewController:rootNaV];
            
            return NO;
        }
            break;
        default:
        {
            [XHShowHUD showNOHud:responseMessage];
            return NO;
        }
            break;
    }
}

/**
 验证数据请求的数据
 
 @param object 要解析的数据请求数据
 @return 成功与否
 */
-(BOOL)verifyResponseObject:(NSDictionary*)object
{
    NSInteger responseCode = [[object objectForKey:@"STATE"] integerValue];
    
    
    switch (responseCode)
    {
        case 0:
        {
            return YES;
        }
            break;
        default:
        {
            return NO;
        }
            break;
    }
}

/**
 解析网络请求数据

 @param object 返回的数据问题
 @return 解析之后的数据
 */
-(NSDictionary*)analyzingObject:(id)object
{
   
    return [object objectItemKey:@"OBJECT"];
    
}


#pragma mark - NetWork Method
- (void)getWithUrl:(NSString *)url
            sucess:(NetWorkSucessBlock)sucessBlock
             error:(NetWorkErrorBlock)errorBlock
{
 
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
      
        
        
        [self GET:url parameters:self.paramDictionary success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [XHShowHUD hideHud];
               NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
              NSLog(@"object===============%@",responseObject);
             sucessBlock(responseObject,verifyObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
            [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             errorBlock(error);
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
}



#pragma mark 未解析GET方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回掉
 @param errorBlock  失败回调
 */
- (void)getUnAnalyzingWithUrl:(NSString *)url
                       sucess:(NetWorkSucessBlock)sucessBlock
                        error:(NetWorkErrorBlock)errorBlock
{
    
    
    
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
        [self GET:url parameters:self.paramDictionary success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [XHShowHUD hideHud];
             NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResponseObject:responseObject];
             NSLog(@"object===============%@",responseObject);
             sucessBlock(responseObject,verifyObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             errorBlock(error);
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
}







- (void)postWithUrl:(NSString *)url
             sucess:(NetWorkSucessBlock)sucessBlock
              error:(NetWorkErrorBlock)errorBlock
{

    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
        NSLog(@"\nurl======%@",url);
        NSLog(@"\n参数%@",self.paramDictionary);
        
        [self POST:url parameters:self.paramDictionary  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [XHShowHUD hideHud];
             NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             NSLog(@"object===============%@",responseObject);
             
          
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             NSLog(@"error===============%@",error);
             errorBlock(error);
             
            
            
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"HaoXueYunError":@"好学云自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
}




#pragma mark 标准的POST请求
- (void)postNormativeWithUrl:(NSString *)url
             sucess:(NetWorkSucessBlock)sucessBlock
              error:(NetWorkErrorBlock)errorBlock
{
    if ([AFNetworkingHelper connectedToNetWork])
    {
        NSLog(@"\nurl======%@",url);
        NSLog(@"\n参数%@",self.paramDictionary);
        
        [self POST:url parameters:self.paramDictionary  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [XHShowHUD hideHud];
             NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             NSLog(@"object===============%@",responseObject);
             
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             NSLog(@"error===============%@",error);
             errorBlock(error);
             
             
             
         }];
    }
    else
    {
        NSError *error = [[NSError alloc] initWithDomain:url code:400 userInfo:@{@"HaoXueYunError":@"好学云自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
}


#pragma mark 获取QQ的Unionid的POST方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postQQUnionidWithUrl:(NSString *)url
                        sucess:(NetWorkSucessBlock)sucessBlock
                         error:(NetWorkErrorBlock)errorBlock
{
    if ([AFNetworkingHelper connectedToNetWork])
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager POST:url parameters:self.paramDictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  formData)
         {
             
             
         } success:^(NSURLSessionDataTask *task,id responseObject)
         {
             NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSString *strUrl = [string stringByReplacingOccurrencesOfString:@"callback( {" withString:@""];
             strUrl = [strUrl stringByReplacingOccurrencesOfString:@"} );\n" withString:@""];
             
             NSMutableDictionary *itemDictionary = [NSMutableDictionary dictionary];
             NSArray *itemArray = [strUrl componentsSeparatedByString:@","];
             
             [NSArray enumerateObjectsWithArray:itemArray usingforceBlock:^(NSString *obj, NSUInteger idx, BOOL *stop, BOOL forceStop)
             {
                 NSArray *itemObjectArray = [obj componentsSeparatedByString:@":"];
                 [NSArray enumerateObjectsWithArray:itemObjectArray usingforceBlock:^(NSString *itemObject, NSUInteger itemidx, BOOL *stop, BOOL forceStop)
                  {
                      switch (idx)
                      {
                          case 0:
                          {
                              switch (itemidx)
                              {
                                  case 1:
                                  {
                                       itemObject = [itemObject stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                                      [itemDictionary setObject:itemObject forKey:@"appid"];
                                  }
                                      break;
                                  default:
                                      break;
                              }
                          }
                              break;
                          case 1:
                          {
                              switch (itemidx)
                              {
                                  case 1:
                                  {
                                      itemObject = [itemObject stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                                      [itemDictionary setObject:itemObject forKey:@"openid"];
                                  }
                                      break;
                                  default:
                                      break;
                              }
                          }
                              break;
                          case 2:
                          {
                              switch (itemidx)
                              {
                                  case 1:
                                  {
                                      itemObject = [itemObject stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                                      [itemDictionary setObject:itemObject forKey:@"unionid"];
                                  }
                                      break;
                                  default:
                                      break;
                              }
                          }
                              break;
                      }
                  }];
             }];
             
             
             sucessBlock(itemDictionary,YES);
        
             
             
         } failure:^(NSURLSessionDataTask *task, NSError *error)
         {
             [XHShowHUD showNOHud:@"登录失败，请尝试重试！"];
             errorBlock(error);
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
}







#pragma mark POST方法网络请求
/**
 @param url 接口后缀url地址
 @param sucessBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)postUnAnalyzingWithUrl:(NSString *)url
                        sucess:(NetWorkSucessBlock)sucessBlock
                         error:(NetWorkErrorBlock)errorBlock
{
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {

        NSLog(@"\nurl======%@",url);
        NSLog(@"\n参数%@",self.paramDictionary);
        
        [self POST:url parameters:self.paramDictionary  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [XHShowHUD hideHud];
             NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResponseObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             NSLog(@"object===============%@",responseObject);
             
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             NSLog(@"error===============%@",error);
             errorBlock(error);
             
             
             
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
    
}


#pragma mark -
- (void)postWithIntegrityUrl:(NSString *)url
             sucess:(NetWorkSucessBlock)sucessBlock
              error:(NetWorkErrorBlock)errorBlock
{
    
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
        NSLog(@"url****************%@",url);
        
        [self POST:url parameters:self.paramDictionary  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             NSLog(@"sussess===============%@",responseObject);
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             NSLog(@"object===============%@",responseObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             NSLog(@"error===============%@",error);
             errorBlock(error);
             
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
    
}

- (void)postFormDataObjectWithUrl:(NSString *)url
                          constructingBodyWithBlock:(NetWorkConstructingBodyWithBlock)constructingBodyWithBlock
                                             sucess:(NetWorkSucessBlock)sucessBlock
                                              error:(NetWorkErrorBlock)errorBlock;
{
    
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
        [self POST:url parameters:self.paramDictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
         {
             constructingBodyWithBlock(formData);
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
              [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             errorBlock(error);
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
   
}


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
                      error:(NetWorkErrorBlock)errorBlock
{
    switch (self.option)
    {
        case XHNetWorkOptionService:
        {
            url = [NSString stringWithFormat:@"%@%@",ServiceBaseUrl,url];
        }
            break;
        default:
            break;
    }
    
    if ([AFNetworkingHelper connectedToNetWork])
    {
        
        [self POST:url parameters:self.paramDictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
         {
             constructingBodyWithBlock(formData);
             
         } progress:^(NSProgress * _Nonnull uploadProgress)
         {
             progressWithBlock(uploadProgress);
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             BOOL verifyObject = [self verifyResPonseObject:responseObject];
             responseObject = [self analyzingObject:responseObject];
             sucessBlock(responseObject,verifyObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
            [XHShowHUD showNOHud:@"请求失败，请尝试重试！"];
             errorBlock(error);
         }];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:url code:400 userInfo:@{@"error":@"自定义错误"}];
        errorBlock(error);
        [self alertFailed];
    }
  
}

-(void)alertFailed
{
    [XHShowHUD showTextHud];
    [XHShowHUD showNOHud:@"当前网络不可用，请检查网络"];
    
}



#pragma mark - Getter / Setter
-(NSMutableDictionary *)paramDictionary
{
    if (_paramDictionary == nil)
    {
        _paramDictionary = [NSMutableDictionary dictionary];
    }
    return _paramDictionary;
}



@end

