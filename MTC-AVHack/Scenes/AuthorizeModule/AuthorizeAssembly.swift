//
//  AuthorizeAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class AuthorizeAssembly {
    
    static func build() -> AuthorizeViewController {
        
        let view = AuthorizeViewController(nibName: "AuthorizeViewController", bundle: nil)
        
        let presenter = AuthorizePresenterImp()
        
        let dataProvider = AuthorizeDataProviderImp()
        
        let router = AuthorizeRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
