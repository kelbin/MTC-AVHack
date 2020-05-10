//
//  LearnPresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol LearnPresenterInput: ViewState, DataSourceCollectionActionDelegate, DataSourceActionDelegate, ButtonTapDelegate {
    
}


final class LearnPresenterImp {
    
    unowned var view: LearnViewInput!
    
    var router: LearnRouter!
    var dataProvider: LearnDataProvider!
    
    var topCollection: [TopCollectionViewCellModel] = []
    
    init() { }
}


extension LearnPresenterImp: LearnPresenterInput {
    
    func didTap() {
        router.goToNextScreen()
    }
    
   
    func didTapCollection<T>(with model: T) {
        guard model is TopCollectionViewCellModel,
            let model = model as? TopCollectionViewCellModel
            else { return }
    
        let tableModel = dataProvider.getTableData(state: model.state)
        let collectionModel = dataProvider.getCollectionData(selected: model)
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
    func didTap<T>(with model: T) {
        
        switch model {
        case is ProgrammsTableViewModel:
            guard let model = model as? ProgrammsTableViewModel else { return }
            
            let index = programmsArray.firstIndex(where: { $0.title == model.title }) ?? 0
            
            programmsArray[index].isOpen = programmsArray[index].isOpen ? false : true
            
            let tableModel = dataProvider.getTableData(state: .programms)
            
            view.updateRow(model: tableModel, index: index, isOpen: programmsArray[index].isOpen)
            
        case is NewsBlockTableViewModel:
            
            guard let model = model as? NewsBlockTableViewModel else { return }
            
            let index = learningArray.firstIndex(where: { $0.title == model.title }) ?? 0
            
            learningArray[index].isShow = learningArray[index].isShow ? false : true
            
            let tableModel = dataProvider.getTableData(state: .learning(isShow: learningArray[index].isShow, index: index))
            
            view.updateTableModel(model: tableModel)
        default:
            break
        }
        
    }
    
    func viewDidLoad() {
        
        let tableModel = dataProvider.getTableData(state: .provisions)
        let collectionModel = dataProvider.getCollectionData(selected: nil)
        
        view.updateTableModel(model: tableModel)
        view.updateCollectionModel(model: collectionModel)
    }
    
    
}
