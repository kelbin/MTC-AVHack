//
//  WriteUsAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class WriteUsAssembly {
    
    static func build() -> WriteUsViewController {
        
        let view = WriteUsViewController(nibName: "WriteUsViewController", bundle: nil)
        
        let presenter = WriteUsPresenterImp()
        
        let dataProvider = WriteUsDataProviderImp()
        
        let router = WriteUsRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
