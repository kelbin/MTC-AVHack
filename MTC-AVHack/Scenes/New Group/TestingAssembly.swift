//
//  TestingAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class TestingAssembly {
    
    static func build() -> TestingViewController {
        
        let view = TestingViewController(nibName: "TestingViewController", bundle: nil)
        
        let presenter = TestingPresenterImp()
        
        let dataProvider = TestingDataProviderImp()
        
        let router = TestingRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
