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
    
    /**
     Method for registering device to getting the notificacions
     
     
     */
    func registerForPushNotifications(application: UIApplication) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(
            options: [.badge, .sound, .alert,.criticalAlert]) { [weak self] granted, _ in
            guard granted else { return }
            
            center.delegate = self?.notificationDelegate
            
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }

    func sendPushNotificationDetails(using deviceToken: Data) {
        guard let url = URL(string: APIConfig.shared.host + "/notification/token") else { fatalError("Invalid URL string") }
        
        let tokenModel = TokenRegister(token: deviceToken)
        #if DEBUG
        print(tokenModel)
        #endif
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = tokenModel.encode()
        if let token = APIConfig.shared.apiToken {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        
        let task = URLSession.shared.dataTask(with: request)
        task.resume()
    }
}


struct TokenRegister {
    
    private var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    let tokenEquipo: String
    let tipoEquipo: Int
    
    
    init(token:Data){
        self.tokenEquipo = token.reduce("") { $0 + String(format: "%02x", $1) }
        self.tipoEquipo = 1
    }
}


extension TokenRegister: Encodable {
    private enum CodingKeys: CodingKey {
        case tokenEquipo, tipoEquipo
    }
    
    func encode() -> Data? {
        return try? encoder.encode(self)
    }
}


extension TokenRegister: CustomStringConvertible {
    var description: String {
        return String(data: self.encode()!, encoding: .utf8) ?? "invalid"
    }
}



