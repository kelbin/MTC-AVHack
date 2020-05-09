//
//  Protocols.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 08/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

typealias ActionBlock = () -> Void

protocol TableViewCellModel {
    
    var cellHeight: CGFloat { get }
    
    var cellSelectedAction: ActionBlock { get }
    
    func cell(in tableView: UITableView) -> UITableViewCell
}

extension TableViewCellModel {
    
    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var cellSelectedAction: ActionBlock {
        return {}
    }
}

protocol TableViewHeaderModel {
    
    var headerHeight: CGFloat { get }
    
    func headerView(in tableView: UITableView) -> UITableViewHeaderFooterView
}

extension TableViewHeaderModel {
    var headerHeight: CGFloat {
        return UITableView.automaticDimension
    }
}


protocol CollectionViewCellModel {
    
    var cellSize: CGSize { get }
    
    var cellSelectedAction: ActionBlock { get }
    
    func cell(in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
}

extension CollectionViewCellModel {
    
    var cellSize: CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    var cellSelectedAction: ActionBlock {
        return {}
    }
    
}

protocol Assembly {
    associatedtype Model
    associatedtype VC
    static func build(model: Model?) -> VC
}


