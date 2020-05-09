//
//  AuthorizeViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol AuthorizeViewInput: class {
    func updateTableModel(model: [TableSection])
}

final class AuthorizeViewController: UIViewController {
    
    private lazy var dataSourceTableView: DataSourceTableView = {
        return DataSourceTableView()
    }()
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: AuthorizePresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configTableView() {
        
        tableView.dataSource = dataSourceTableView
        tableView.delegate = dataSourceTableView
        
        dataSourceTableView.collection = tableView
        dataSourceTableView.tapDelegate = presenter
        
        tableView.register(cellType: TitleTableViewCell.self)
        tableView.register(cellType: DescriptionTableViewCell.self)
        tableView.register(cellType: TextFieldTableViewCell.self)
        tableView.register(cellType: ImageTableViewCell.self)
        tableView.register(cellType: ButtonTableViewCell.self)
        tableView.register(cellType: SpacesTableViewCell.self)
    }
    
}

extension AuthorizeViewController: AuthorizeViewInput {
    
    func updateTableModel(model: [TableSection]) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadData()
    }
}


