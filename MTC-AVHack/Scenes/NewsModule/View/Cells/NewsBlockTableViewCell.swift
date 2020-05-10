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
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.layer.addBorder(edge: .top, color: UIColor.lightText, thickness: 1)
    }
    
    func config(_ model: NewsBlockTableViewModel) {
        nameLabel.text = model.title
    }
}

struct NewsBlockTableViewModel: TableViewCellModel {
    
    let title: String
    let date: String
    var isShow: Bool
    
    init(title: String, date: String, isShow: Bool) {
        self.title = title
        self.date = date
        self.isShow = isShow
    }
    
    var cellHeight: CGFloat = 209
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: NewsBlockTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
