//
//  TextFieldTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loginTextField.addBottomBorder()
    }
    
    func config(_ model: TextFieldTableViewModel) {
        switch model.titleIsHidden {
        case true:
            headerTitleLabel.isHidden = true
            loginTextField.isSecureTextEntry = true
            loginTextField.keyboardType = .default
            loginTextField.placeholder = "Введите пароль"
        case false:
            headerTitleLabel.isHidden = false
            loginTextField.keyboardType = .emailAddress
            loginTextField.isSecureTextEntry = false
            loginTextField.placeholder = "user@mts.ru"
            
        }
    }
    
}

struct TextFieldTableViewModel: TableViewCellModel {
    
    let titleIsHidden: Bool
    
    init(titleIsHidden: Bool) {
        self.titleIsHidden = titleIsHidden
    }
    
    var cellHeight: CGFloat = 60
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: TextFieldTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
