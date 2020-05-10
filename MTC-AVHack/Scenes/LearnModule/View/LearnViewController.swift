//
//  LearnViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol LearnViewInput: class {
    func updateRow(model: [TableSection], index: Int, isOpen: Bool)
    func updateTableModel(model: [TableSection])
    func updateCollectionModel(model: [CollectionSection])
}

final class LearnViewController: UIViewController {
    
    private lazy var dataSourceTableView: DataSourceTableView = {
        return DataSourceTableView()
    }()
    
    private lazy var dataSourceCollectionView: DataSourceCollectionView = {
        return DataSourceCollectionView()
    }()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    var presenter: LearnPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configCollectionView()
        configViewController()
        presenter.viewDidLoad()
    }
    
    private func configViewController() {
        self.title = "Обучение"
    }
    
    private func configTableView() {
        
        tableView.dataSource = dataSourceTableView
        tableView.delegate = dataSourceTableView
        
        dataSourceTableView.collection = tableView
        dataSourceTableView.actionDelegate = presenter
        
        let nib = UINib(nibName: HeaderLearnView.reuseIdentifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: HeaderLearnView.reuseIdentifier)
        tableView.register(cellType: DocumentLearnTableViewCell.self)
        tableView.register(cellType: NewsBlockTableViewCell.self)
        tableView.register(cellType: SpacesTableViewCell.self)
        tableView.register(cellType: ProgrammsTableViewCell.self)
        tableView.register(cellType: AttachedTableViewCell.self)
    }
    
    private func configCollectionView() {
        
        topCollectionView.dataSource = dataSourceCollectionView
        topCollectionView.delegate = dataSourceCollectionView
        
        dataSourceCollectionView.collection = topCollectionView
        dataSourceCollectionView.actionDelegate = presenter
        
        topCollectionView.register(cellType: TopCollectionViewCell.self)
    }
    
}

extension LearnViewController: LearnViewInput {
    
    func updateRow(model: [TableSection], index: Int, isOpen: Bool) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadData(with: .transitionCrossDissolve)
    }
    
    func updateTableModel(model: [TableSection]) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadSections(IndexSet(integer: 0), with: .fade)
    }
    
    func updateCollectionModel(model: [CollectionSection]) {
        dataSourceCollectionView.updateCollectionModel(items: model)
        topCollectionView.reloadData()
    }
}
