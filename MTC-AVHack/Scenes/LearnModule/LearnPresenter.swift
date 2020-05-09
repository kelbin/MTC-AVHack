//
//  LearnPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol LearnPresenterInput: ViewState, DataSourceCollectionActionDelegate {
    
}


final class LearnPresenterImp {
    
    unowned var view: LearnViewInput!
    
    var router: LearnRouter!
    var dataProvider: LearnDataProvider!
    
    var topCollection: [TopCollectionViewCellModel] = []
    
    init() { }
}


extension LearnPresenterImp: LearnPresenterInput {
   
    func didTap<T>(with model: T) {
        guard model is TopCollectionViewCellModel,
            var model = model as? TopCollectionViewCellModel
            else { return }
        
        let tableModel = dataProvider.getTableData(state: model.state)
        let collectionModel = dataProvider.getCollectionData()
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getTableData(state: .provisions)
        let collectionModel = dataProvider.getCollectionData()
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
}
