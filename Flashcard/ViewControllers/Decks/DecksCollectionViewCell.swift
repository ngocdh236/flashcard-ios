//
//  DecksCollectionViewCell.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

class DecksCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    
    private var cornerRadius: CGFloat = 10.0
    private lazy var shadowLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.fillColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        return layer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = false
        clipsToBounds = false
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Update shadow path
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
    }
}
