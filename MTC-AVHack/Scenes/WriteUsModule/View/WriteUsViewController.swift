//
//  WriteUsViewController.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 10/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

protocol WriteUsViewInput: class {
    func updateTableModel(model: [TableSection])
}

final class WriteUsViewController: UIViewController {
    
    private lazy var dataSourceTableView: DataSourceTableView = {
        return DataSourceTableView()
    }()
    
    private lazy var messageBarButton: UIBarButtonItem = {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "message_icon"), style: .done, target: self, action: #selector(messageBarButtonAction))
    }()
    
    private lazy var settingsBarButton: UIBarButtonItem = {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "settings_icon"), style: .done, target: self, action: #selector(settingsBarButtonAction))
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: WriteUsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configViewController()
        addNavigationBar()
        presenter.viewDidLoad()
    }
    
    private func configViewController() {
        self.title = "Есть вопрос?"
    }
    
    private func configTableView() {
        
        tableView.dataSource = dataSourceTableView
        tableView.delegate = dataSourceTableView
        
        dataSourceTableView.collection = tableView
        dataSourceTableView.tapDelegate = presenter
        
        tableView.register(cellType: WUTableViewCell.self)
    }
    
    private func addNavigationBar() {
        navigationItem.leftBarButtonItem = messageBarButton
        navigationItem.rightBarButtonItem = settingsBarButton
        self.navigationController?.navigationBar.tintColor = .lightGray
    }
    
    
    @objc func messageBarButtonAction() {
        
    }
    
    @objc func settingsBarButtonAction() {
        
    }
    
}

extension WriteUsViewController: WriteUsViewInput {
    
    func updateTableModel(model: [TableSection]) {
        dataSourceTableView.updateCollectionModel(items: model)
        tableView.reloadData()
    }
}



