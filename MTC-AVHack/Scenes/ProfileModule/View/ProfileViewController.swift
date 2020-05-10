//
//  ProfileViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol ProfileViewInput: class {
    func updateTableModel(model: [TableSection])
}

final class ProfileViewController: UIViewController {
    
    private lazy var dataSourceTableView: DataSourceTableView = {
        return DataSourceTableView()
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ProfilePresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configViewController()
        presenter.viewDidLoad()
    }
    
    private func configViewController() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configTableView() {
        
        tableView.dataSource = dataSourceTableView
        tableView.delegate = dataSourceTableView
        
        dataSourceTableView.collection = tableView
        dataSourceTableView.tapDelegate = presenter
        
        tableView.register(cellType: HeaderProfileTableViewCell.self)
        tableView.register(cellType: TopCollectionTableViewCell.self)
        tableView.register(cellType: CircularProgressTableViewCell.self)
        tableView.register(cellType: ButtonTableViewCell.self)
        tableView.register(cellType: SpacesTableViewCell.self)
        tableView.register(cellType: TraineTableViewCell.self)
        tableView.register(cellType: TraineeDetailsViewCell.self)
    }
}

extension ProfileViewController: ProfileViewInput {
    
    func updateTableModel(model: [TableSection]) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadData()
    }
}



