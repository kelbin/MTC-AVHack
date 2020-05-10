//
//  AttachedTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class AttachedTableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapToStartTesting(_ sender: Any) {
        
    }
    
    func config(_ model: AttachedTableViewModel) {
        
        
        
    }
    
}

struct AttachedTableViewModel: TableViewCellModel {
    
    var isOpen: Bool
    
    init(isOpen: Bool = false) {
        self.isOpen = isOpen
    }
    
    var cellHeight: CGFloat = 571
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: AttachedTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
