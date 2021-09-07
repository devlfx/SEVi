//
//  APNUploads.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 02/09/21.
//

import Foundation
import UIKit

// Extension for handling notifications in the application
extension AppDelegate {
    
  func registerForPushNotifications(application: UIApplication) {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(
        options: [.badge, .sound, .alert,.criticalAlert]) { granted, _ in
      guard granted else { return }
    
      DispatchQueue.main.async {
        application.registerForRemoteNotifications()
      }
    }
  }

  func sendPushNotificationDetails(to urlString: String, using deviceToken: Data) {
    guard let url = URL(string: urlString) else { fatalError("Invalid URL string") }

            //var details = TokenDetails(token: deviceToken)
//            ApiClient.shared.
//            #if DEBUG
//            details.debug.toggle()
//            print(details)
//            #endif
//
//            var request = URLRequest(url: url)
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = details.encoded()
//
//            URLSession.shared.dataTask(with: request).resume()
          }
}

// Extension to show notifications when app is in foreground
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler:
    @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound, .badge])
  }
}
