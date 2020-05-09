//
//  NewsRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol NewsRouter {
    func goToNextScreen()
}

final class NewsRouterImp {
    
    unowned var viewController: NewsViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: NewsViewController) {
        self.viewController = viewController
    }
}

extension NewsRouterImp: NewsRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
}
