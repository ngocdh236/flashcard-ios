//
//  DecksViewController.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit
import RealmSwift

class DecksViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    var decks: Results<Deck>!
    
    var decksObserverToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Decks"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        collectionView.registerNib(DecksCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.layer.masksToBounds = false

        decks = realm.objects(Deck.self)
        decksObserverToken = decks?.observe({_ in
            self.collectionView.reloadData()
        })
    }
    
    @objc private func addButtonPressed() {
        let alertController = UIAlertController(title: "Add New Deck", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) {_ in
            if let textField = alertController.textFields?.first, let text = textField.text {
                let deck = Deck()
                deck.name = text
                try! self.realm.write {
                    self.realm.add(deck)
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
        let cell: DecksCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.nameLabel.text = decks[indexPath.row].name
        cell.numberOfCardsLabel.text = String(decks[indexPath.row].cards.count)
        
        return cell
    }
}

extension DecksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deckDetailsViewController = DeckDetailsViewController()
        deckDetailsViewController.deck = decks[indexPath.row]
        navigationController?.pushViewController(deckDetailsViewController, animated: true)
    }
}

extension DecksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt _: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        return CGSize(width: width, height: 200.0)
    }

    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
