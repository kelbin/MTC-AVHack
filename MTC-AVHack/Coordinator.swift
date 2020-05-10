//
//  Coordinator.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

class Coordinator {
    
    static var dataProvider: TestingDataProvider!
    static var viewController: LearnViewController?
    static var helper: TestingViewInput?
    
    static func tap() {
        
        let navigation = TestingAssembly.build()
    
        viewController?.navigationController?.pushViewController(navigation, animated: true)
        
    }
    
    static func tapped() {
        
        let model = dataProvider.getData(state: .result(isWinner: true))
        
        helper?.updateTableModel(model: model)
    }
    
    
}
