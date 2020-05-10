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
    case learning
    case options
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
            
            
        case .learning:
            
            header = HeaderLearnViewModel(title: "Обучение")
            
            cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
            
            (0...10).forEach { num in
                cells.append(NewsBlockTableViewModel(title: "Brbrbr", date: "10 ноября 2020"))
                cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
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
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Обучение", isSelected: false, state: .learning))
        topCollectionCells.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Кейсы", isSelected: false, state: .options))
        
        return [CollectionSection(headerModel: nil, cellModels: topCollectionCells)]
        
    }
    
}

var programmsArray: [ProgrammsTableViewModel] = [
    ProgrammsTableViewModel(title: "Sketch", image: #imageLiteral(resourceName: "sketch"), isOpen: true),
    ProgrammsTableViewModel(title: "Miro", image: #imageLiteral(resourceName: "miror"), isOpen: false)
]
