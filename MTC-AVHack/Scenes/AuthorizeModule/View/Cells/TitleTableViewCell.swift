//
//  TitleTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: TitleTableViewModel) {
        
    }
    
}

struct TitleTableViewModel: TableViewCellModel {
    
    var cellHeight: CGFloat = 60
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: TitleTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
