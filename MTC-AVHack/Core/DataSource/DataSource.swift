//
//  DataSource.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 08/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

struct SectionModel<HeaderModel, CellModel> {
    var headerModel: HeaderModel?
    var cellModels: [CellModel]
}

typealias TableSection = SectionModel<TableViewHeaderModel, TableViewCellModel>
typealias CollectionSection = SectionModel<TableViewHeaderModel, CollectionViewCellModel>

protocol DataSource {
    associatedtype Item
    associatedtype Collection
    var collection: Collection { get set }
    var sectionModels: [Item] { get set }
    func updateCollectionModel(items: [Item])
}

protocol DataSourceCollectionActionDelegate: class {
    func didTap<T>(with model: T)
}

protocol DataSourceActionDelegate: class {
    func didTap<T>(with model: T)
}

protocol DataSourceTapDelegate: class {
    var delegate: AnyObject? { get set }
}

final class DataSourceTableView: NSObject, DataSource {
    
    typealias Item = TableSection
    typealias Collection = UITableView
    
    var collection: Collection = UITableView()
    var sectionModels: [Item] = []
    
    weak var actionDelegate: DataSourceActionDelegate?
    var tapDelegate: AnyObject?
    
    func updateCollectionModel(items: [Item]) {
        sectionModels = items
        collection.reloadData()
    }
}


extension DataSourceTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionDelegate?.didTap(with: sectionModels[indexPath.section].cellModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sectionModels[section]
        guard let headerModel = section.headerModel else {
            return nil
        }
        return headerModel.headerView(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sectionModels[section]
        guard let headerModel = section.headerModel else {
            return 0
        }
        return headerModel.headerView(in: tableView).frame.height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionModels[indexPath.section].cellModels[indexPath.row].cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sectionModels[indexPath.section].cellModels[indexPath.row].cell(in: tableView)
        
        (cell as? DataSourceTapDelegate)?.delegate = tapDelegate
        
        return cell
    }
}


final class DataSourceCollectionView: NSObject {
    
    typealias Item = CollectionSection
    typealias Collection = UICollectionView
    
    var collection: Collection = UICollectionView(frame: .zero, collectionViewLayout: .init())
    var sectionModels: [Item] = []
    
    weak var actionDelegate: DataSourceCollectionActionDelegate?
}

extension DataSourceCollectionView: DataSource {
    
    func updateCollectionModel(items: [Item]) {
        sectionModels = items
        collection.reloadData()
    }
    
}

extension DataSourceCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionDelegate?.didTap(with: sectionModels[indexPath.section].cellModels[indexPath.row])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sectionModels[indexPath.section].cellModels[indexPath.row].cell(in: collectionView, at: indexPath)
    }
    
}
