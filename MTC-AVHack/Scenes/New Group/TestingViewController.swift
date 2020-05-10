//
//  TestingViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol TestingViewInput: class {
    func updateTableModel(model: [TableSection])
}

final class TestingViewController: UIViewController {
    
    private lazy var dataSourceTableView: DataSourceTableView = {
        return DataSourceTableView()
    }()
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: TestingPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configViewController()
        presenter.viewDidLoad()
    }
    
    private func configViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Новости"
    }
    
    private func configTableView() {
        
        tableView.dataSource = dataSourceTableView
        tableView.delegate = dataSourceTableView
        
        dataSourceTableView.collection = tableView
        dataSourceTableView.tapDelegate = presenter
        
        tableView.register(cellType: TestingBlockTableViewCell.self)
        tableView.register(cellType: SpacesTableViewCell.self)
    }
    
}

extension TestingViewController: TestingViewInput {
    
    func updateTableModel(model: [TableSection]) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadData()
    }
}


