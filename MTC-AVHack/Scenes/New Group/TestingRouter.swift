//
//  TestingRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol TestingRouter {
    func goToNextScreen()
}

final class TestingRouterImp {
    
    unowned var viewController: TestingViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: TestingViewController) {
        self.viewController = viewController
    }
}

extension TestingRouterImp: TestingRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}
