//
//  ProgrammsTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class ProgrammsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var topView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(_ model: ProgrammsTableViewModel) {
        iconImageView.image = model.image
        nameLabel.text = model.title
        changeHeightAnimate(isOpen: model.isOpen)
    }
    
    
    private func changeHeightAnimate(isOpen: Bool) {
        
        if isOpen {
            heightConstraint.constant = 172
        } else {
            heightConstraint.constant = 0
        }
        
        self.layoutIfNeeded()
        
        
    }
    
}


struct ProgrammsTableViewModel: TableViewCellModel {
    
    let title: String
    let image: UIImage
    var isOpen: Bool
    
    init(title: String, image: UIImage, isOpen: Bool = false) {
        self.title = title
        self.image = image
        self.isOpen = isOpen
    }
    
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: ProgrammsTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
