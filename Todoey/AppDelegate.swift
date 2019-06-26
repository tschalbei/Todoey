//
//  AppDelegate.swift
//  Todoey
//
//  Created by Christian Sailer on 19.06.19.
//  Copyright © 2019 Christian Sailer. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)

        do {
            _ = try Realm()
        } catch {
            print("Error initializing new realm, \(error)")
        }
        
        return true
    }
}

