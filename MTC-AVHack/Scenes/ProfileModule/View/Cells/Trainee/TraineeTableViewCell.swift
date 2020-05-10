//
//  TraineeTableViewCell.swift
//  MTC-AVHack
//
//  Created by Ванурин Алексей Максимович on 10.05.2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TraineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var avataIcon: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(_ model: TraineeTableViewCellModel)  {
        nameLabel.text = model.fullName
        jobLabel.text = model.job
        avataIcon.image = #imageLiteral(resourceName: "female_icon")
        
        contentView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1)
        
        if model.rounded {
            backView.layer.cornerRadius = 11.0
        } else {
            backView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            backView.layer.cornerRadius = 11.0
        }
    }
    
}
