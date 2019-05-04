//
//  DecksCollectionViewController.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit
import RealmSwift

class DecksViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    private let reuseId = "decksCollectionViewCell"
    
    let decks = Results<Deck>!
    
    let decks = ["1", "1", "1", "1", "1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Decks"
        
        //        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonPressed))
        
        collectionView.register(UINib(nibName: "DecksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
        collectionView.dataSource = self
        //        collectionView.delegate = self
    }
    
    @objc private func createButtonPressed() {
        
    }
}

extension DecksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return decks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! DecksCollectionViewCell
        cell.nameLabel.text = decks[indexPath.row]
        return cell
    }
}
