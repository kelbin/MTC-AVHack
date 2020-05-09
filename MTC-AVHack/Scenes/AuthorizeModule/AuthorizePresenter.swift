//
//  AuthorizePresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol AuthorizePresenterInput: ViewState, ButtonTapDelegate {
    
}


final class AuthorizePresenterImp {
    
    unowned var view: AuthorizeViewInput!
    
    var router: AuthorizeRouter!
    var dataProvider: AuthorizeDataProvider!
    
    init() { }
}


extension AuthorizePresenterImp: AuthorizePresenterInput {
   
    func didTap() {
        router?.goToNextScreen()
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getData()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}
