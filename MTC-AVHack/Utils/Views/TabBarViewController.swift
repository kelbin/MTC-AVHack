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
        
        auth.tabBarItem = UITabBarItem(title: "Новости", image: nil, selectedImage: nil)
        auth2.tabBarItem = UITabBarItem(title: "Обучение", image: nil, selectedImage: nil)
        auth3.tabBarItem = UITabBarItem(title: "Профиль", image: nil, selectedImage: nil)
        auth4.tabBarItem = UITabBarItem(title: "Еще", image: nil, selectedImage: nil)
        auth5.tabBarItem = UITabBarItem(title: "Спросить", image: nil, selectedImage: nil)
        
        let tabBarList = [auth, auth2, auth5, auth3, auth4]
        
        viewControllers = tabBarList
    }
    
}
