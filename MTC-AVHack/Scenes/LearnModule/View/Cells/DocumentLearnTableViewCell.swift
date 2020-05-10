//
//  CommonLearnTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class DocumentLearnTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(_ model: DocumentLearnTableViewModel) {
        nameLabel.text = model.title
        iconImageView.image = model.image
        
        if model.dateIsHidden {
            
            dateLabel.isHidden = true
            dateLabel.text = ""
            
        } else {
            
            dateLabel.isHidden = false
            dateLabel.text = model.date
            nameLabel.font = model.font
        }
    
    }
    
}

struct DocumentLearnTableViewModel: TableViewCellModel {
    
    let title: String
    let date: String
    let image: UIImage
    let dateIsHidden: Bool
    let font: UIFont?
    
    init(title: String, image: UIImage, date: String, dateIsHidden: Bool, font: UIFont?) {
        self.title = title
        self.image = image
        self.date = date
        self.dateIsHidden = dateIsHidden
        self.font = font
    }
    
    var cellHeight: CGFloat = 46
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: DocumentLearnTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}


