//
//  NotificationApp.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 14/07/21.
//

import SwiftUI

@main
struct NotificationApp: App {
    // Create a deleate to start the app 
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            let vm = AuthViewModel()
            
            ContentView()
                .environmentObject(vm)
                .environmentObject(appDelegate.notificationDelegate)
                .environment(\.locale, Locale(identifier: Locale.current.languageCode ?? "en"))
        }
    }
}
