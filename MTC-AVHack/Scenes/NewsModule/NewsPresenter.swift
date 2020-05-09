//
//  NewsPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol NewsPresenterInput: ViewState, ButtonTapDelegate {
    
}


final class NewsPresenterImp {
    
    unowned var view: NewsViewInput!
    
    var router: NewsRouter!
    var dataProvider: NewsDataProvider!
    
    init() { }
}


extension NewsPresenterImp: NewsPresenterInput {
    
    func didTap() {
        router?.goToNextScreen()
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getData()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}
