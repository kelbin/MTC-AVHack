//
//  TraineeDetailsViewCell.swift
//  MTC-AVHack
//
//  Created by Ванурин Алексей Максимович on 10.05.2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TraineeDetailsViewCell: UITableViewCell {
    
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var naznachenoLabel: UILabel!
    @IBOutlet weak var overallLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(_ model: TraineeDetailsViewCellModel)  {
        completedLabel.text = "Материалов изучено: 40%"
        naznachenoLabel.text = "Назначено обучений: 3"
        overallLabel.text = "Всего пройдено обучений: 6"
        timeLabel.text = "Время в приложении: 380 минут"
        endLabel.text = "Конец испытательного срока: 2 месяца, 9 дней"
        
        contentView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1)
        
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        backView.layer.cornerRadius = 11.0
        //backView.layer.masksToBounds = true
        
    }
    
}
