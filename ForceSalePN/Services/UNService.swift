//
//  UNService.swift
//  ForceSalePN
//
//  Created by iMac on 11/10/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class UNService : NSObject {
    private override init() {  }
    static let shared = UNService()
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options : UNAuthorizationOptions = [.alert,.badge,.sound]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No Auth Error")
            guard granted else { return }
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    
    func configure() {
        unCenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
}

extension UNService : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN Did Recive")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN will Prsent")
        let options : UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}

