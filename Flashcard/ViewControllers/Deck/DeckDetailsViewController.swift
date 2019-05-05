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
    @IBOutlet weak var cardsCollectionView: UICollectionView!

    var deck: Deck!

    var cards: [Card] = [] {
        didSet {
            cardsCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = deck.name
        deck.cards.forEach { cards.append($0) }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))

        cardsCollectionView.registerNib(CardsCollectionViewCell.self)
        cardsCollectionView.dataSource = self
        cardsCollectionView.delegate = self
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
        cell.keyLabel.text = cards[indexPath.row].key
        return cell
    }
}

extension DeckDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension DeckDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
    ) -> CGSize {
        let width = cardsCollectionView.bounds.width / 2 - 10
        return CGSize(width: width, height: width * 2)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 20.0
    }
}
