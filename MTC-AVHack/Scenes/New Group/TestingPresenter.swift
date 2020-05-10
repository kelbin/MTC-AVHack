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
    
    unowned var view: TestingViewInput!
    
    var router: TestingRouter!
    var dataProvider: TestingDataProvider!
    
    init() { }
}


extension TestingPresenterImp: TestingPresenterInput {
    
    func didTap() {
        router?.goToNextScreen()
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getData()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}
