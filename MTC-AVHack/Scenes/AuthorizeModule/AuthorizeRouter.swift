//
//  AuthorizeRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol AuthorizeRouter {
    func goToNextScreen()
}

final class AuthorizeRouterImp {
    
    unowned var viewController: AuthorizeViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: AuthorizeViewController) {
        self.viewController = viewController
    }
}

extension AuthorizeRouterImp: AuthorizeRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = TabBarViewController()
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}

