//
//  ProfileRouter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol ProfileRouter {
    func goToNextScreen()
    func goToDevices()
}

final class ProfileRouterImp {
    
    unowned var viewController: ProfileViewController!
    
    var routerTransition: CustomTransitionRouter?
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
}

extension ProfileRouterImp: ProfileRouter {
    
    func goToNextScreen() {
        
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let navigation = UINavigationController(rootViewController: TabBarViewController())
        
        navigation.transitioningDelegate = routerTransition
        
        viewController.present(navigation, animated: true, completion: nil)
    }
    
    func goToDevices() {
        routerTransition = CustomTransitionRouter(viewController: viewController)
        
        let vc = DeviceAssembly.build()
        
        viewController.present(vc, animated: true, completion: nil)
    }
    
}
