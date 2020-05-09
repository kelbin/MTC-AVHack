//
//  ImageTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ model: ImageTableViewModel) {
        logoImageView.image = model.image
    }
    
}

struct ImageTableViewModel: TableViewCellModel {
    
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    var cellHeight: CGFloat = 88
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: ImageTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
