//
//  TraineeDetailsViewCellModel.swift
//  MTC-AVHack
//
//  Created by Ванурин Алексей Максимович on 10.05.2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

struct TraineeDetailsViewCellModel: TableViewCellModel {
    
    //var rounded
    
    var cellHeight: CGFloat {
        return 234.0
    }
    
    var cellSelectedAction: ActionBlock = {
    }
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: TraineeDetailsViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        
        return cell
    }
    
}
