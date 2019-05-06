//
//  UICollectionViewCell.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/6/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

protocol ReusableView {}

extension ReusableView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {}
