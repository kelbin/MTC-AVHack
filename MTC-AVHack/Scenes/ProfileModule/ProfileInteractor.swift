//
//  ProfileInteractor.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol ProfileInteractor: class {
    func obtainRequestProfile()
}

final class ProfileInteractorImp {
    
    // MARK: - Properties
    
    weak var presenter: ProfileInteractorOutput?
    
    private let service: ProfileService
    
    // MARK: - Init
    
    init(service: ProfileService) {
        self.service = service
    }
    
}

// MARK: - Profile Interactor

extension ProfileInteractorImp: ProfileInteractor {
    
    func obtainRequestProfile() {
        
        let success: (ProfileModel) -> Void = { [weak interactor = self] model in
            DispatchQueue.main.async {
                interactor?.presenter?.didSuccessLoad(model: model)
            }
        }
        
        let failure: (ErrorType) -> Void = { [weak interactor = self] errorType in
            DispatchQueue.main.async {
                interactor?.presenter?.didFailedLoad()
            }
        }
        
        service.request(success: success, failure: failure)
    }
    
}
