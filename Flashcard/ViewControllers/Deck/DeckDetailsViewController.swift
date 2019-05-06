//
//  DeckDetailsViewController.swift
//  Flashcard
//
//  Created by Hồng Ngọc Doãn on 5/4/19.
//  Copyright © 2019 Titek. All rights reserved.
//

import UIKit
import RealmSwift

class DeckDetailsViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!

    var deck: Deck!

    var cards: [Card] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = deck.name
        deck.cards.forEach { cards.append($0) }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))

        collectionView.registerNib(CardsCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @objc private func addButtonPressed() {
        let alertController = UIAlertController(title: "Add New Card", message: nil, preferredStyle: .alert)

        alertController.addTextField { (textField) in
            textField.placeholder = "Key"
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Value"
        }

        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let keyTextField = alertController.textFields?[0], let keyText = keyTextField.text, let valueTextField = alertController.textFields?[1], let valueText = valueTextField.text {
                let newCard = Card()
                newCard.key = keyText
                newCard.value = valueText
                self.cards.append(newCard)
                try! self.realm.write {

                    self.deck.cards.append(newCard)
                }
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension DeckDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.label.text = cards[indexPath.row].key
        cell.key = cards[indexPath.row].key
        cell.value = cards[indexPath.row].value
        return cell
    }
}

extension DeckDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardsCollectionViewCell
        cell.animation()
    }
}

extension DeckDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width / 2 + 40
        return CGSize(width: width, height: 400)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
