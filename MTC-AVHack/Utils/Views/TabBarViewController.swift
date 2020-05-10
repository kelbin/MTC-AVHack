//
//  TabBarViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let auth = UINavigationController(rootViewController: NewsAssembly.build())
        let auth2 = UINavigationController(rootViewController: LearnAssembly.build())
        let auth3 = UINavigationController(rootViewController: ProfileAssembly.build())
        let auth4 = UINavigationController(rootViewController: AuthorizeAssembly.build())
        let auth5 = UINavigationController(rootViewController: WriteUsAssembly.build())
        
        auth.tabBarItem = UITabBarItem(title: "Новости", image: #imageLiteral(resourceName: "firstItem"), selectedImage: nil)
        auth2.tabBarItem = UITabBarItem(title: "Обучение", image: #imageLiteral(resourceName: "secondItem"), selectedImage: nil)
        auth3.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "thirdItem"), selectedImage: nil)
        auth5.tabBarItem = UITabBarItem(title: "Спросить", image: #imageLiteral(resourceName: "fourthItem"), selectedImage: nil)
        
        let tabBarList = [auth, auth2, auth5, auth3]
        
        self.tabBar.tintColor = #colorLiteral(red: 0.8862745098, green: 0.02352941176, blue: 0.07058823529, alpha: 1)
        
        viewControllers = tabBarList
    }
    
}
