//
//  NewsAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class NewsAssembly {
    
    static func build() -> NewsViewController {
        
        let view = NewsViewController(nibName: "NewsViewController", bundle: nil)
        
        let presenter = NewsPresenterImp()
        
        let dataProvider = NewsDataProviderImp()
        
        let router = NewsRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
