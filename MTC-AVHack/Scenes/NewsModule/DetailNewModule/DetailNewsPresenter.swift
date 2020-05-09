//
//  DetailDetailNewsPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol DetailNewsPresenterInput: ViewState, ButtonTapDelegate {
    
}


final class DetailNewsPresenterImp {
    
    unowned var view: DetailNewsViewInput!
    
    var router: DetailNewsRouter!
    var dataProvider: DetailNewsDataProvider!
    
    init() { }
}


extension DetailNewsPresenterImp: DetailNewsPresenterInput {
    
    func didTap() {
        router?.goToNextScreen()
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getData()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}
