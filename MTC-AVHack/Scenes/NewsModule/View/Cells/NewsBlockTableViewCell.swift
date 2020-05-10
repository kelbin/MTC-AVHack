//
//  NewsBlockTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class NewsBlockTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.layer.addBorder(edge: .top, color: UIColor.lightText, thickness: 1)
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
