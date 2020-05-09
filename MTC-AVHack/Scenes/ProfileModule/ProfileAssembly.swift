//
//  ProfileAssembly.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class ProfileAssembly {
    
    static func build() -> ProfileViewController {
        
        let view = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        
        let presenter = ProfilePresenterImp()
        
        let dataProvider = ProfileDataProviderImp()
        
        let router = ProfileRouterImp(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        
        presenter.dataProvider = dataProvider
        presenter.router = router
        
        return view
    }
    
}
