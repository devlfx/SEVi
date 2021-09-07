//
//  AppDelegate.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 15/07/21.
//


import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
          [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        registerForPushNotifications(application: application)
        return true
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      let token = deviceToken.reduce("") { $0 + String(format: "%02x", $1) }
      print(token)
    }
    
    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print(error)
    }


}
