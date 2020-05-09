//
//  LearnRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol LearnRouter {
    func goToNextScreen()
}

final class LearnRouterImp {
    
    unowned var viewController: LearnViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: LearnViewController) {
        self.viewController = viewController
    }
}

extension LearnRouterImp: LearnRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}
