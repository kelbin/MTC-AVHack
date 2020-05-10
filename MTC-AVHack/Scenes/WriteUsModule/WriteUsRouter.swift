//
//  WriteUsRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol WriteUsRouter {
    func goToNextScreen()
}

final class WriteUsRouterImp {
    
    unowned var viewController: WriteUsViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: WriteUsViewController) {
        self.viewController = viewController
    }
}

extension WriteUsRouterImp: WriteUsRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}
