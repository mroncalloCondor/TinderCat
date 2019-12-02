//
//  LocalNotificationsManager.swift
//  CatCore
//
//  Created by Miguel Roncallo on 12/1/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import UserNotifications

public final class LocalNotificationsManager: LocalNotificationsManagerType {

    public static func scheduleNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
    
    private static func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .badge, .sound]) { granted, error in
            if granted && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    private static func scheduleNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = "Here in TinderCat we miss you. Come and look at pretty cats!"
        content.sound = .default
        let date = Date()
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            timeZone: .current,
                                            hour: calendar.component(.hour, from: date),
                                            minute: calendar.component(.minute, from: date))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "DAILY_REMINDER_ID",
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
            print("Notification scheduled")
        }
    }
}

