//
//  DecksCollectionViewCell.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

class DecksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.cornerRadius = 5.0
    }
}
