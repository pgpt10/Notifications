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
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var subTitleLabel: UILabel?
    @IBOutlet var bodyLabel: UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification)
    {
        self.titleLabel?.text = notification.request.content.title
        self.subTitleLabel?.text = notification.request.content.subtitle
        self.bodyLabel?.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void)
    {
        if response.actionIdentifier == "accept"
        {
            print("Accept - from Extension")
            DispatchQueue.main.async {
                completion(.dismissAndForwardAction)
            }
        }
        else
        {
            DispatchQueue.main.async {
                completion(.dismiss)
            }
        }
    }
}


