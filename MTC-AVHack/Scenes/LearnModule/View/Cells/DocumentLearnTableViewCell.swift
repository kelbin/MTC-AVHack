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
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(_ model: DocumentLearnTableViewModel) {
        nameLabel.text = model.title
        dateLabel.text = model.date
    }
    
}

struct DocumentLearnTableViewModel: TableViewCellModel {
    
    let title: String
    let date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
    
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: DocumentLearnTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}


