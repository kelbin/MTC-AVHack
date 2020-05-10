//
//  LearnDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

enum LearnStates {
    case provisions
    case document
    case programms
    case learning(isShow: Bool, index: Int)
}

protocol LearnDataProvider: class {
    func getCollectionData() -> [CollectionSection]
    func getTableData(state: LearnStates) -> [TableSection]
}

final class LearnDataProviderImp: LearnDataProvider {
    
    func getTableData(state: LearnStates = .provisions) -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        var header: TableViewHeaderModel?
        
        switch state {
        case .provisions:
            
            header = HeaderLearnViewModel(title: "Общие Положения")
            
            cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 10))
            
            (0...5).forEach { num in
                cells.append(DocumentLearnTableViewModel(title: "Ценности компании МТС",
                                                         image: #imageLiteral(resourceName: "important"),
                                                         date: "",
                                                         dateIsHidden: true,
                                                         font: nil))
                cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 10))
                
            }
        case .document:
            
            header = HeaderLearnViewModel(title: "Документы")
            
            cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 10))
            
            (0...5).forEach { num in
                cells.append(DocumentLearnTableViewModel(title: "Договор о найме",
                                                         image: #imageLiteral(resourceName: "important"), date: "10.07.2020",
                                                         dateIsHidden: false,
                                                         font: UIFont.systemFont(ofSize: 14)))
                cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 10))
            }
                
        case .programms:
                
            header = HeaderLearnViewModel(title: "Программы", dateIsHidden: true)
            
            cells = programmsArray
            
            
        case .learning(let isShow, let index):
            
            header = HeaderLearnViewModel(title: "Обучение")
            
            cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
            
            cells = learningArray
            
            cells.insert(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20), at: 0)
            cells.insert(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20), at: 2)
            cells.insert(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20), at: 4)
            cells.insert(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20), at: 6)
            
            switch isShow {
                
            case true:
                
                var array: [TableViewCellModel] = []
                
                learningArray.enumerated().forEach { (offset, object) in
                    if offset == index {
                        array.append(object)
                    }
                }
                
                array.append(AttachedTableViewModel())
                
                array.insert(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20), at: 1)
                
                cells = array
            default:
                break
            }
            
        default:
            break
        }
        
        
        return [TableSection(headerModel: header, cellModels: cells)]
    }
        
    func getCollectionData() -> [CollectionSection] {
        
        #warning("Добавить бек")
        var topCollectionCells: [CollectionViewCellModel] = []
        
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Положения", isSelected: false, state: .provisions))
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Документы", isSelected: false, state: .document))
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Программы", isSelected: false, state: .programms))
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Обучение", isSelected: false, state: .learning(isShow: false, index: 0)))
        
        return [CollectionSection(headerModel: nil, cellModels: topCollectionCells)]
        
    }
    
}

var programmsArray: [ProgrammsTableViewModel] = [
    ProgrammsTableViewModel(title: "Sketch", image: #imageLiteral(resourceName: "sketch"), isOpen: true),
    ProgrammsTableViewModel(title: "Miro", image: #imageLiteral(resourceName: "miror"), isOpen: false)
]

var learningArray: [NewsBlockTableViewModel] = [
    NewsBlockTableViewModel(title: "Первый", date: "10 ноября 2020", isShow: false),
    NewsBlockTableViewModel(title: "Второй", date: "12 ноября 2020", isShow: false),
    NewsBlockTableViewModel(title: "Третий", date: "13 ноября 2020", isShow: false)
]
