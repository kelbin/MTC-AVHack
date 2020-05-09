//
//  ButtonTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol ButtonTapDelegate: class {
    func didTap()
}

final class ButtonTableViewCell: UITableViewCell, DataSourceTapDelegate {
    
    weak var delegate: AnyObject?
    
    @IBOutlet weak var commonButton: UIButton!
    
    @IBAction func tapToButton(_ sender: Any) {
        guard let delegate = delegate as? ButtonTapDelegate else { return }
        delegate.didTap()
    }
    
    func config(_ model: ButtonTableViewModel) {
        commonButton.setTitle(model.title, for: .normal)
        self.contentView.backgroundColor = model.backgroundColor
    }
    
    
}

struct ButtonTableViewModel: TableViewCellModel {
    
    let title: String
    let backgroundColor: UIColor
    
    init(title: String, backgroundColor: UIColor = .white) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    var cellHeight: CGFloat = 60
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: ButtonTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
