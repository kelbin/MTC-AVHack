//
//  HeaderLearnTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class HeaderLearnTableViewCell: UITableViewCell {

    @IBOutlet weak var documentsLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(_ model: HeaderLearnTableViewModel) {
        
    }
    
}


struct HeaderLearnTableViewModel: TableViewCellModel {
    
    init() {
        
    }
    
    var cellHeight: CGFloat = 80
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: HeaderLearnTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
