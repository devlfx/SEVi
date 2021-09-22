//
//  NotificationDelegate.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 19/09/21.
//

import UserNotifications
import Combine

final class NotificationDelegate:NSObject,UNUserNotificationCenterDelegate,ObservableObject {
    @Published var isInformPresented = false
    @Published var idInform = 0
    
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
            @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound, .badge])
    }
    
    
    
    /**
     Create an action when a certain key is contained in the push notification and the notification is touched
     - Parameters:
        - center: An instance of the object in charge for handling notifications
        - response:
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void ) {
        // We ensure the completion is executed at the end of the method
        defer { completionHandler() }
        
        guard response.actionIdentifier
                == UNNotificationDefaultActionIdentifier else {
            return
        }
        
        print(response.notification.request.content.userInfo)
        
        if response.notification.request.content.userInfo["idInforme"] != nil, let value = response.notification.request.content.userInfo["idInforme"], let idInform = value as? Int{
            self.idInform = idInform
            self.isInformPresented = true
        }
    }

    
}
