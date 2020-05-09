//
//  DetailDetailNewsRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol DetailNewsRouter {
    func goToNextScreen()
}

final class DetailNewsRouterImp {
    
    unowned var viewController: DetailNewsViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: DetailNewsViewController) {
        self.viewController = viewController
    }
}

extension DetailNewsRouterImp: DetailNewsRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}
