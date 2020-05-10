//
//  TestingPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol TestingPresenterInput: ViewState, ButtonTapDelegate {
    
}


final class TestingPresenterImp {
    
    let isWinner: Bool = false
    
    unowned var view: TestingViewInput!
    
    var router: TestingRouter!
    var dataProvider: TestingDataProvider!
    
    init() { }
}


extension TestingPresenterImp: TestingPresenterInput {
    
    func didTap() {
        let model = dataProvider.getData(state: .result(isWinner: isWinner))
        view.updateTableModel(model: model)
    }
    
    
    func viewDidLoad() {
        
        Coordinator.dataProvider = dataProvider
        Coordinator.helper = view
        
        let tableModel = dataProvider.getData(state: .start)
        view.updateTableModel(model: tableModel)
        
    }
    
}
