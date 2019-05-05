//
//  CardsCollectionViewCell.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var keyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.cornerRadius = 5.0
    }
}
