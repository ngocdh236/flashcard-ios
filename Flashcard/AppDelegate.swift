//
//  AppDelegate.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let decksCollectionViewController = DecksCollectionViewController()
        
        window!.rootViewController = decksCollectionViewController
        
        window!.makeKeyAndVisible()
        
        return true
    }
}

