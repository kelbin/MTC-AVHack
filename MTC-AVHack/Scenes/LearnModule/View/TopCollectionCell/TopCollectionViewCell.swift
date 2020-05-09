//
//  TopCollectionViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 11
        self.contentView.layer.borderColor = UIColor.lightText.cgColor
        self.contentView.layer.borderWidth = 1
    }
    
    func config(_ model: TopCollectionViewCellModel) {
        
        nameLabel.text = model.text
        
        switch model.isSelected {
        case true:
            contentView.backgroundColor = .red
        case false:
            contentView.backgroundColor = .white
        default:
            break
        }
        
    }

}

struct TopCollectionViewCellModel: CollectionViewCellModel {
    
    var cellSize: CGSize = CGSize(width: 93, height: 108)
    
    let image: UIImage
    let text: String
    var isSelected: Bool
    let state: LearnStates
    
    init(image: UIImage, text: String, isSelected: Bool, state: LearnStates) {
        self.image = image
        self.text = text
        self.isSelected = isSelected
        self.state = state
    }
    
    func cell(in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell: TopCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        collectionCell.config(self)
        return collectionCell
    }
    
}
