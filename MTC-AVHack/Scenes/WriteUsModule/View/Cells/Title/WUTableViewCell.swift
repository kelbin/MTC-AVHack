//
//  TitleWUTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class WUTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var categoriesTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBorder(view: themeTextField)
        addBorder(view: categoriesTextField)
        addBorder(view: messageTextView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: WUTableViewModel) {
        
        
        
    }
    
    private func addBorder(view: UIView) {
        
        view.layer.borderColor = UIColor.lightText.cgColor
        view.layer.borderWidth = 2
    }
    
}

struct WUTableViewModel: TableViewCellModel {
    
    let title: String
    let date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
    
    var cellHeight: CGFloat = 653
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: WUTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
