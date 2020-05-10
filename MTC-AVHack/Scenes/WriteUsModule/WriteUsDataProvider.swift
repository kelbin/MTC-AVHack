//
//  WriteUsDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol WriteUsDataProvider: class {
    
    func getData() -> [TableSection]
}

final class WriteUsDataProviderImp: WriteUsDataProvider {
    
    func getData() -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        
        cells.append(WUTableViewModel(title: "", date: ""))
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }
    
}
