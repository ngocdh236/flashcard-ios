//
//  Card.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import Foundation
import RealmSwift

class Card: Object {
    @objc dynamic var key: String = ""
    @objc dynamic var value: String = ""
}
