//
//  CircularProgressTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class CircularProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var JDView: UIView!
    var circular: JDProgressRoundView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circular = JDProgressRoundView(frame: JDView.frame, howtoincrease: .water, unit: "30", ProgressColor: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), BorderWidth: 15)
        self.contentView.addSubview(circular)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func config(_ model: CircularProgressTableViewModel)  {
        circular.setProgress(30, animated: true)
    }
    
}

struct CircularProgressTableViewModel: TableViewCellModel {
    
    let procent: String
    
    init(procent: String) {
        self.procent = procent
    }
    
    var cellHeight: CGFloat = 310
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: CircularProgressTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
