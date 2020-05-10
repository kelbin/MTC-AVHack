//
//  TestingDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol TestingDataProvider: class {
    func getData() -> [TableSection]
}

final class TestingDataProviderImp: TestingDataProvider {
    
    func getData() -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        
        
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }

}
