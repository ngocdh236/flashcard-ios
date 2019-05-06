//
//  CardsCollectionViewCell.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var label: UILabel!

    var key: String!
    var value: String!
    var isKey = true

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.cornerRadius = 5.0
    }
    
    func animation() {
        isKey = !isKey
        let text = isKey ? key : value
        let animationOption: UIView.AnimationOptions = isKey ? .transitionFlipFromLeft : .transitionFlipFromRight
        
        UIView.transition(with: contentView, duration: 0.3, options: animationOption, animations: {
            self.label.text = text
        }, completion: nil)
    }
}
