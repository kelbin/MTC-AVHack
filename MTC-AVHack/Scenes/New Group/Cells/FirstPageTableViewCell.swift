//
//  FirstPageTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class FirstPageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(_ model: FirstPageTableViewModel) {
        
        
    }
    
    @IBAction func goToStep(_ sender: Any) {
        
    }
    
}

struct FirstPageTableViewModel: TableViewCellModel {
    
    
    init() {
        
    }
    
    var cellHeight: CGFloat = 566
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: FirstPageTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}

