//
//  AppDelegate.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let decksViewController = DecksViewController()
        
        let decksNavigationController = UINavigationController(rootViewController: decksViewController)
        
        window!.rootViewController = decksNavigationController
        
        window!.makeKeyAndVisible()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        return true
    }
}

