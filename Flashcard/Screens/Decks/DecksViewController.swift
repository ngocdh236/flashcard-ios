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
    
    private let reuseId = "decksCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    var decks: Results<Deck>!
    
    var decksObserverToken: NotificationToken?
    
    var deck: Deck = Deck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Decks"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        collectionView.register(UINib(nibName: "DecksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        decks = realm.objects(Deck.self)
        decksObserverToken = decks?.observe({_ in
            self.collectionView.reloadData()
        })
    }
    
    @objc private func addButtonPressed() {
        let alertController = UIAlertController(title: "Add New Deck", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) {_ in
            if let textField = alertController.textFields?.first, let text = textField.text {
                self.deck.name = text
                try! self.realm.write {
                    self.realm.add(self.deck)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension DecksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let decks = decks {
            return decks.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! DecksCollectionViewCell
        if let decks = decks {
            cell.nameLabel.text = decks[indexPath.row].name
            cell.numberOfCardsLabel.text = String(decks[indexPath.row].cardsArray.count)
        }
        return cell
    }
}

extension DecksViewController: UICollectionViewDelegate {
    
}

extension DecksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
        ) -> CGSize {
        let width = collectionView.bounds.width - 20
        return CGSize(width: width, height: 200.0)
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 20.0
    }
}
