//
//  HeaderLernView.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class HeaderLearnView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func config(_ model: HeaderLearnViewModel) {
        nameLabel.text = model.title
        
        if model.dateIsHidden {
            dateLabel.isHidden = true
        } else {
            dateLabel.isHidden = false
        }
    }
    
}

struct HeaderLearnViewModel: TableViewHeaderModel {
    
    var headerHeight: CGFloat = 65
    
    let title: String
    let date: String
    let dateIsHidden: Bool
    
    init(title: String, date: String = "", dateIsHidden: Bool = false) {
        self.title = title
        self.date = date
        self.dateIsHidden = dateIsHidden
    }
    
    func headerView(in tableView: UITableView) -> UITableViewHeaderFooterView {
        let view: HeaderLearnView = tableView.dequeueReusableHeaderView()
        view.contentView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1)
        view.config(self)
        return view
    }
    
}
