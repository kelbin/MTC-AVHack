//
//  TraineeTableViewCellModel.swift
//  MTC-AVHack
//
//  Created by Ванурин Алексей Максимович on 10.05.2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation
import UIKit

struct TraineeTableViewCellModel: TableViewCellModel {
    
    var fullName: String
    var job: String
    var rounded: Bool
    
    var cellHeight: CGFloat {
        return 72.0
    }
    
    var cellSelectedAction: ActionBlock = {
    }
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: TraineTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        
        return cell
    }
    
}
