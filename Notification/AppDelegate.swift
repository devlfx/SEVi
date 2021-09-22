//
//  AppDelegate.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 15/07/21.
//


import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let notificationDelegate = NotificationDelegate()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
          [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        // Register for notifications
        registerForPushNotifications(application: application)
        return true
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        sendPushNotificationDetails(using:deviceToken)
      
    }
    
    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print(error)
    }


    
}
