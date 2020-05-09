//
//  SpacesTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class SpacesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: SpacesTableViewModel) {
        
        self.contentView.backgroundColor = model.color
    }
    
}


struct SpacesTableViewModel: TableViewCellModel {
    
    let color: UIColor
    
    init(color: UIColor = .white, cellHeight: CGFloat = 88) {
        self.color = color
        self.cellHeight = cellHeight
    }
    
    var cellHeight: CGFloat = 88
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: SpacesTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
