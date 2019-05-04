//
//  Deck.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Deck: Object {
    @objc dynamic var name: String = ""
    
    var cardsArray: List<Card> = List<Card>()
}
