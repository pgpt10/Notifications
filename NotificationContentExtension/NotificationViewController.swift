//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Payal Gupta on 27/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension
{
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification)
    {
        self.label?.text = notification.request.content.body
    }
}
