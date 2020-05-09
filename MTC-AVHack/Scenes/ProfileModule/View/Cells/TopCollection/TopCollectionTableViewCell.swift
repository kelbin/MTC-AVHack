//
//  TopCollectionTableViewCell.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

final class TopCollectionTableViewCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var dataSource: DataSourceCollectionView = {
        return DataSourceCollectionView()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
        
        dataSource.collection = collectionView
        
        collectionView.register(cellType: TopCollectionViewCell.self)
    }
    
    func config(_ model: TopCollectionTableViewModel) {
        
        dataSource.updateCollectionModel(items: [CollectionSection(headerModel: nil, cellModels: model.sectionsModel)])
        
        collectionView.reloadData()
    }
    
}

struct TopCollectionTableViewModel: TableViewCellModel {
    
    var cellHeight: CGFloat = 110
    var sectionsModel: [CollectionViewCellModel]
    
    init(sectionsModel: [CollectionViewCellModel]) {
        self.sectionsModel = sectionsModel
    }
    
    func cell(in tableView: UITableView) -> UITableViewCell {
        let cell: TopCollectionTableViewCell = tableView.dequeueReusableCell()
        cell.config(self)
        return cell
    }
}
