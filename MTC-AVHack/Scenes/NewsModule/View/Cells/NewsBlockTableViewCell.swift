//
//  NewsBlockTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class NewsBlockTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: NewsBlockTableViewModel) {
        
        
    }
}

struct NewsBlockTableViewModel: TableViewCellModel {
    
    let title: String
    let date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
    
    var cellHeight: CGFloat = 209
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: NewsBlockTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
