//
//  SecondPageTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class SecondPageTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: SecondPageTableViewModel) {
        
        iconImageView.image = model.image
        nameLabel.text = model.text
    }
    
    @IBAction func tapToExit(_ sender: Any) {
        
    }
    
}

struct SecondPageTableViewModel: TableViewCellModel {
    
    let image: UIImage
    let text: String
    
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
    }
    
    var cellHeight: CGFloat = 700
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: SecondPageTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
