//
//  AppDelegate.swift
//  Notifications
//
//  Created by Payal Gupta on 26/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        //Configuration
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            //granted = yes, if app is authorized for all of the requested interaction types
            //granted = no, if one or more interaction type is disallowed
        }
        
        //Categories - define the types of notifications that your app supports and communicate to the system how you want a notification to be presented
        
        //GENERAL Category
        let generalCategory = UNNotificationCategory(identifier: "GENERAL", actions: [], intentIdentifiers: [], options: .customDismissAction)
        
        //INVITATION Category
        let remindLaterAction = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: UNNotificationActionOptions(rawValue: 0))
        let acceptAction = UNNotificationAction(identifier: "accept", title: "Accept", options: .foreground)
        let declineAction = UNNotificationAction(identifier: "decline", title: "Decline", options: .destructive)
        let commentAction = UNTextInputNotificationAction(identifier: "comment", title: "Comment", options: .authenticationRequired, textInputButtonTitle: "Send", textInputPlaceholder: "Share your thoughts..")
        let invitationCategory = UNNotificationCategory(identifier: "INVITATION", actions: [remindLaterAction, acceptAction, declineAction, commentAction], intentIdentifiers: [], options: UNNotificationCategoryOptions(rawValue: 0))
        
        center.setNotificationCategories([generalCategory, invitationCategory])
        
        //Remote Notification Configuration
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    
    //Handling remote notifications
    //
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    {
        print(error.localizedDescription)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate
{
    //Here you get the callback for notification, if the app is in FOREGROUND.
    //Here you decide whether to silently handle the notification or still alert the user.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .sound]) //execute the provided completion handler block with the delivery option (if any) that you want the system to use. If you do not specify any options, the system silences the notification.
    }
    
    //Here you get the callback when the user selects a custom action.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        switch response.notification.request.content.categoryIdentifier
        {
        case "GENERAL":
            break
            
        case "INVITATION":
            switch response.actionIdentifier
            {
            case "remindLater":
                print("remindLater")
                
            case "accept":
                print("accept")
                
            case "decline":
                print("decline")
                
            case "comment":
                print("comment")
                
            default:
                break
            }
            
        default:
            break
        }
        completionHandler()
    }
    
    //Here you get the payload of a remote notification whenever it arrives.
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        print("Original Remote Notification:\n\(userInfo)")
        completionHandler(.newData)
    }
}

/*
{
    "aps": {
        "alert": {
            "title": "Invitation",
            "subtitle": "This is a Remote Notification.",
            "body": "You are invited."
        },
        "category": "INVITATION",
        "sound": "default",
        "content-available": 1,
        "mutable-content": 1
    }
}
 */
