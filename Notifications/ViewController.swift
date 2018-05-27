//
//  ViewController.swift
//  Notifications
//
//  Created by Payal Gupta on 26/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController
{
    //MARK: Lifecycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK: Button Action Methods
    @IBAction func scheduleNotification(_ sender: Any)
    {
        //Notification Content
        let content = UNMutableNotificationContent()
        content.title = "Invitation"
        content.subtitle = "This is a Local Notification."
        content.body = "You are invited."
        content.categoryIdentifier = "INVITATION"
        content.sound = UNNotificationSound.default()
        
        //Notification Trigger - when the notification should be fired
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //Notification Request
        let request = UNNotificationRequest(identifier: "Anniversary", content: content, trigger: trigger)
        
        //Scheduling the Notification
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error
            {
                print(error.localizedDescription)
            }
        }
    }
}

