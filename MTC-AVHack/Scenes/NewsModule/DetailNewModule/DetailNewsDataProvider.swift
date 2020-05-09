//
//  DetailNewsDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol DetailNewsDataProvider: class {
    
    func getData() -> [TableSection]
}

final class DetailNewsDataProviderImp: DetailNewsDataProvider {
    
    func getData() -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
//        
//        cells.append()
//        cells.append()
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }

    
}
