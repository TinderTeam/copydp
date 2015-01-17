//
//  ESConfig.h
//  EShoping
//
//  Created by Seven on 14-11-14.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#ifndef EShoping_ESConfig_h
#define EShoping_ESConfig_h

//Singleton define
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;
//Singleton method
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


//LocalString
#define FEString(_S)                            NSLocalizedString(_S, @"")

// App infomation
#define FEDidLaunchedFirstTime(_V)              [NSString stringWithFormat:@"DidLaunchedFirstTime V-%@",_V]
#define	FEAppVersion                            [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define	FEAppIdentifier                         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define FEAppBuildVersion                       [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define FERateTimes                            [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"RateTimes"] integerValue]
#define FEAppItunesID                           [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppItunesIdentifier"]

//NSUserDefaults

#define FEUserDefaults                          [NSUserDefaults standardUserDefaults]
#define FEUserDefaultsObjectForKey(_KEY)        [FEUserDefaults objectForKey:_KEY]
#define FEUserDefaultsSetObjectForKey(_O,_KEY)  [FEUserDefaults setObject:_O forKey:_KEY]
#define FEUserDefaultsRemoveForKey(_KEY)        [FEUserDefaults removeObjectForKey:_KEY]
#define FEUserDefaultsSync                      [FEUserDefaults synchronize]

//device token
#define FEDeviceToken                           @"deviceToken"

//Run times
#define FERunTimes                              @"runTimes"

//never grade
#define FERateNever                            @"rateNever"

//region
#define FEShopRegionKey                         @"region"


//itunes url
#define FEItunesUrlString(_ID)                  [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",_ID]

//uicolor
#define FEColor(_R,_G,_B,_A)                    [UIColor colorWithRed:_R / 255.0f green:_G / 255.0f blue: _B / 255.0f alpha:_A]

//#define FEThemeColor                            FEColor(252, 156, 56, 1)
#define FEThemeOrange                           FEColor(255, 126, 46, 1)
#define FEThemeWhite                            FEColor(252, 252, 252, 1)
#define FEButtonColor                           FEColor(250, 177, 60, 1)
#define FEGrayButtonColor                       FEColor(202,202,202,1)

#define FEFont(_S)                              [UIFont systemFontOfSize:_S]

#define FECoreData                              ([AppDelegate sharedDelegate].coreDataHandler)

#define FELoginUser                             [FECoreData fetchUser]

#define FEDeletUser()                             {[FECoreData deleteCoreData:\
                                                @[FELoginUser,FELoginUser.usercustomer]];\
                                                [FECoreData saveCoreData];}

#define FEShopImageUrlSring(_A)                 [NSString stringWithFormat:@"%@/copydp/Public/uploads/img/%@",__WEB_SERVICE_IP,_A]

//notification
#define FERegionCityDidChang                    @"RegionCityDidChange"

#define FEUserStatDidChang                      @"userStatDidChang"

#define kAlert(_M)                              {[[[UIAlertView alloc] initWithTitle:FEString(@"提示") message:_M delegate:nil cancelButtonTitle:FEString(@"确定") otherButtonTitles: nil] show]; }

#endif
