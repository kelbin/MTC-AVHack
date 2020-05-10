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
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "MTSSans-Regular", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        self.tabBar.tintColor = .red
        
        let auth = NewsAssembly.build()
        let auth2 = LearnAssembly.build()
        let auth3 = ProfileAssembly.build()
        let auth4 = AuthorizeAssembly.build()
        
        auth.tabBarItem = UITabBarItem(title: "Новости", image: #imageLiteral(resourceName: "newspaper 3"), selectedImage: nil)
        auth2.tabBarItem = UITabBarItem(title: "Обучение", image: #imageLiteral(resourceName: "study"), selectedImage: nil)
        auth3.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "man 1"), selectedImage: nil)
        auth4.tabBarItem = UITabBarItem(title: "Еще", image: #imageLiteral(resourceName: "Group 28"), selectedImage: nil)
        
        //auth.font
        
        let tabBarList = [auth, auth2, auth3, auth4]
        
        viewControllers = tabBarList
    }
    
}
