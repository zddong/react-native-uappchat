//
//  ChatView.m
//  ChatView
//
//  Created by zhao on 2019/5/12.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ChatView.h"

#import "JCHATConversationViewController.h"
#import "JCHATAlertViewWait.h"
#import <UIKit/UIKit.h>

@implementation ChatView

RCT_EXPORT_MODULE(JGIMModule);

RCT_EXPORT_METHOD(PushChat){
    
    UIViewController *rootView =  [UIApplication sharedApplication].keyWindow.rootViewController; // 获取当前view
    
    [[JCHATAlertViewWait ins] showInView];
    
    __block JCHATConversationViewController *sendMessageCtl = [[JCHATConversationViewController alloc] init];
    sendMessageCtl.superViewController = self;
    sendMessageCtl.hidesBottomBarWhenPushed = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sendMessageCtl];
    //__weak __typeof(self)weakSelf = self;
    [JMSGConversation createSingleConversationWithUsername:@"zhaocc" appKey:@"627f44d478abf6544b1977a0" completionHandler:^(id resultObject, NSError *error) {
        [[JCHATAlertViewWait ins] hidenAll];
        
        if (error == nil) {
            //[MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            //__strong __typeof(weakSelf) strongSelf = weakSelf;
            sendMessageCtl.conversation = resultObject;
            [rootView presentViewController:nav animated:YES completion:nil];
            // [rootView pushViewController:sendMessageCtl animated:YES];
        } else {
            // DDLogDebug(@"createSingleConversationWithUsername fail");
            // [MBProgressHUD showMessage:@"添加的用户不存在" view:self.view];
        }
    }];
    
}

@end
