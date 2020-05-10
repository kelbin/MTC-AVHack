//
//  LearnPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol LearnPresenterInput: ViewState, DataSourceCollectionActionDelegate, DataSourceActionDelegate {
    
}


final class LearnPresenterImp {
    
    unowned var view: LearnViewInput!
    
    var router: LearnRouter!
    var dataProvider: LearnDataProvider!
    
    var topCollection: [TopCollectionViewCellModel] = []
    
    init() { }
}


extension LearnPresenterImp: LearnPresenterInput {
   
    func didTapCollection<T>(with model: T) {
        guard model is TopCollectionViewCellModel,
            let model = model as? TopCollectionViewCellModel
            else { return }
        
        let tableModel = dataProvider.getTableData(state: model.state)
        let collectionModel = dataProvider.getCollectionData()
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
    func didTap<T>(with model: T) {
        guard model is ProgrammsTableViewModel,
            let model = model as? ProgrammsTableViewModel
            else { return }
        
        let index = programmsArray.firstIndex(where: { $0.title == model.title }) ?? 0
        
        programmsArray[index].isOpen = programmsArray[index].isOpen ? false : true
        
        let tableModel = dataProvider.getTableData(state: .programms)
        
        view.updateRow(model: tableModel, index: index, isOpen: programmsArray[index].isOpen)
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getTableData(state: .provisions)
        let collectionModel = dataProvider.getCollectionData()
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
    
}
