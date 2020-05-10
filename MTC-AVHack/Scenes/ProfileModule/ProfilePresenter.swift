//
//  ProfilePresenter.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol ProfilePresenterInput: ViewState, ButtonTapDelegate {
    
}

protocol ProfileInteractorOutput: class {
    func didSuccessLoad(model: ProfileModel)
    func didFailedLoad()
}


final class ProfilePresenterImp {
    
    unowned var view: ProfileViewInput!
    
    
    var router: ProfileRouter!
    var dataProvider: ProfileDataProvider!
    var adviserDataProvider: AdviserProfileDataProviderImp = AdviserProfileDataProviderImp()
    
    init() { }
}


extension ProfilePresenterImp: ProfilePresenterInput {
    
    func didTap() {
        //router?.goToNextScreen()
        router?.goToDevices()
    }
    
    func viewDidLoad() {
        
        if globalUser.isAdviser {
            let tableModel = adviserDataProvider.getDataToTable()
            view.updateTableModel(model: tableModel)
            return;
        }
        
        let tableModel = dataProvider.getDataToTable()
        
        view.updateTableModel(model: tableModel)
        
    }
    
}

extension ProfilePresenterImp: ProfileInteractorOutput {
    
    func didSuccessLoad(model: ProfileModel) {
        
    }
    
    func didFailedLoad() {
        
    }
    
}
