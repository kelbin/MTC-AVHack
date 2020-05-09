//
//  Extensions+TableView.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 08/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - Functions
    
    func register<T: UITableViewHeaderFooterView>(headerType: T.Type) {
        register(UINib(nibName: T.nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { cellType in
            register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }
    
    func dequeueReusableHeaderView<T: UITableViewHeaderFooterView>() -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}


// MARK: - Animation

extension UITableView {
    
    func reloadData(with animation: AnimationOptions) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: animation, animations: {
            self.reloadData()
        }, completion: nil)
        
    }
    
}


extension UICollectionView {
    
    // MARK: - Functions
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(UINib(nibName: T.nibName, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}
