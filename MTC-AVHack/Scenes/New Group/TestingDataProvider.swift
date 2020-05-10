//
//  TestingDataProvider.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

enum TestingState {
    
    case start
    case result(isWinner: Bool)
    
}

protocol TestingDataProvider: class {
    func getData(state: TestingState) -> [TableSection]
}

final class TestingDataProviderImp: TestingDataProvider {
    
    func getData(state: TestingState) -> [TableSection] {
        
        var cells: [TableViewCellModel] = []
        
        switch state {
        case .start:
            
            cells.append(FirstPageTableViewModel())
            
        case .result(let isWinner):
            
            if isWinner {
                
                cells.append(SecondPageTableViewModel(image: #imageLiteral(resourceName: "cup"), text: """
По результатам теста, вы выбрали неверный ответ в 2 заданиях.
Обучение по данной теме завершено, ваш результат сохранен.
Вы всегда можете вернуться к изучению данного курса в разделе “Обучение”.
"""))
                
            } else {
                
                cells.append(SecondPageTableViewModel(image: #imageLiteral(resourceName: "books"), text: """
По результатам теста, вы набрали слишком мало правильных ответов.
Обучение по данной теме не завершено.
Вам назначено дополнительное обязательное обучение. Вы сможете снова пройти этот тест через несколько дней.
"""))
                
            }
            
        }
        
        
        return [TableSection(headerModel: nil, cellModels: cells)]
    }

}
