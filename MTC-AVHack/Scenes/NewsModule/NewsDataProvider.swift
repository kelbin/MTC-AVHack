//
//  NewsDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol NewsDataProvider: class {
    func getData() -> [TableSection]
}

final class NewsDataProviderImp: NewsDataProvider {
    
    func getData() -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        
        cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
        
        (0...10).forEach { (num) in
            cells.append(NewsBlockTableViewModel(title: "МТС ЛОГО", date: "10 ноября 2018", isShow: false))
            cells.append(SpacesTableViewModel(color: #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.968627451, alpha: 1), cellHeight: 20))
        }
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }

}
