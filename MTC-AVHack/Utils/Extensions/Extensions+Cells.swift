//
//  Extensions+Cells.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 08/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Properties
    
    @nonobjc static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    @nonobjc static var nibName: String {
        return String(describing: self)
    }
    
    
}
