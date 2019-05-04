//
//  UIViewController.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import Foundation
import RealmSwift

extension UIViewController {
    var screenSize: CGRect {
        return UIScreen.main.bounds
    }
    
    var realm: Realm {
        return try! Realm()
    }
}
