//
//  HeaderProfileTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class HeaderProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var achievmentButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(_ model: HeaderProfileTableViewModel) {
        
    }
    
}

struct HeaderProfileTableViewModel: TableViewCellModel {
    
    let fio: String
    let avatar: String
    let job: String
    let achievmentCount: String
    
    init(fio: String, avatar: String, job: String, achievmentCount: String) {
        self.fio = fio
        self.avatar = avatar
        self.job = job
        self.achievmentCount = achievmentCount
    }
    
    var cellHeight: CGFloat = 331
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: HeaderProfileTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}


