//
//  WriteUsPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol WriteUsPresenterInput: ViewState, ButtonTapDelegate {
    
}

protocol WriteUsInteractorOutput: class {
    func didSuccessLoad()
    func didFailedLoad()
}


final class WriteUsPresenterImp {
    
    unowned var view: WriteUsViewInput!
    
    var router: WriteUsRouter!
    var dataProvider: WriteUsDataProvider!
    
    init() { }
}


extension WriteUsPresenterImp: WriteUsPresenterInput {
    
    func didTap() {
        router?.goToNextScreen()
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getData()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}

extension WriteUsPresenterImp: WriteUsInteractorOutput {
    
    func didSuccessLoad() {
        
    }
    
    func didFailedLoad() {
        
    }
    
}
