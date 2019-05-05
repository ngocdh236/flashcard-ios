//
//  Deck.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import Foundation
import RealmSwift

class Deck: Object {
    @objc dynamic var name: String = ""
    
    var cards: List<Card> = List<Card>()
}
