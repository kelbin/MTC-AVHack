//
//  DetailDetailNewsAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class DetailNewsAssembly {
    
    static func build() -> DetailNewsViewController {
        
        let view = DetailNewsViewController(nibName: "DetailNewsViewController", bundle: nil)
        
        let presenter = DetailNewsPresenterImp()
        
        let dataProvider = DetailNewsDataProviderImp()
        
        let router = DetailNewsRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
