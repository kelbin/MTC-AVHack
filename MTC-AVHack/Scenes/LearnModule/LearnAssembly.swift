//
//  LearnAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class LearnAssembly {
    
    static func build() -> LearnViewController {
        
        let view = LearnViewController(nibName: "LearnViewController", bundle: nil)
        
        let presenter = LearnPresenterImp()
        
        let dataProvider = LearnDataProviderImp()
        
        let router = LearnRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
