//
//  UICollectionView+Extensions.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

protocol ReusableView {}

extension UICollectionViewCell: ReusableView {}

extension ReusableView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(_ cellType: T.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: T.reuseableIdentifier, bundle: bundle), forCellWithReuseIdentifier: T.reuseableIdentifier)
    }
    
    func registerClass<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: T.reuseableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseableIdentifier, for: indexPath) as? T else {
            fatalError("\(T.self) has never been registered")
        }
        
        return cell
    }
}
