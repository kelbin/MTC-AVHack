//
//  ProfileDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol ProfileDataProvider: class {
    func getDataToTable() -> [TableSection]
}

final class ProfileDataProviderImp: ProfileDataProvider {
    
    func getDataToTable() -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        var topCollection: [TopCollectionViewCellModel] = []
        
        (0...5).forEach { (num) in
            topCollection.append(TopCollectionViewCellModel(image: #imageLiteral(resourceName: "mts_logo"), text: "Качества", isSelected: false, state: .provisions))
        }
        
        
        cells.append(HeaderProfileTableViewModel(fio: "", avatar: "", job: "", achievmentCount: ""))
        cells.append(TopCollectionTableViewModel(sectionsModel: topCollection))
        cells.append(CircularProgressTableViewModel(procent: "25"))
        cells.append(ButtonTableViewModel(title: "Получить оборудование", backgroundColor: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1)))
        
        cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }
    
}
