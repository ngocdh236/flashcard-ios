//
//  UICollectionView.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit

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
