//
//  AuthorizeDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol AuthorizeDataProvider: class {
    func getData() -> [TableSection]
}

final class AuthorizeDataProviderImp: AuthorizeDataProvider {
    
    func getData() -> [TableSection] {
        var cells: [TableViewCellModel] = []
        
        cells.append(ImageTableViewModel(image: #imageLiteral(resourceName: "mts_logo")))
        cells.append(TitleTableViewModel())
        cells.append(DescriptionTableViewModel())
        cells.append(TextFieldTableViewModel(titleIsHidden: false))
        cells.append(TextFieldTableViewModel(titleIsHidden: true))
        cells.append(SpacesTableViewModel(cellHeight: 100))
        cells.append(ButtonTableViewModel(title: "Войти"))
        return [TableSection(headerModel: nil, cellModels: cells)]
    }

}
