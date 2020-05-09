//
//  ProfileService.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol ProfileService: class {
    func request(success: @escaping (ProfileModel) -> Void, failure: @escaping (ErrorType) -> Void)
}

// MARK: - Imp

final class ProfileServiceImp {
    
    // MARK: - Properties
    
    private let networkClient: NetworkClient
    private let errorHandler: ErrorHandler
    private let decoder: JSONDecoder
    
    // MARK: - Init
    
    init() {
        networkClient = NetworkClient()
        errorHandler = ErrorHandler()
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
    }
    
}


// MARK: - Requests

extension ProfileServiceImp: ProfileService {
    
    func request(success: @escaping (ProfileModel) -> Void, failure: @escaping (ErrorType) -> Void) {
        
        let url = ServiceUtils.URL.profileURL
        
        networkClient.request(url: url, method: .get, responseHandler: { [weak service = self] result in
            
            guard let service = service else { return }
            
            switch result {
                
            case .success(let response):
                
                guard let data = response.data else {
                    failure(.network)
                    return
                }
                
                let entity: ProfileModel
                
                do {
                    entity = try service.decoder.decode(ProfileModel.self, from: data)
                } catch {
                    print(error)
                    failure(.network)
                    return
                }
                
                success(entity)
                
            case .error(let error):
                service.errorHandler.handle(failInfo: error, handler: failure)
            }
            
        })
    }
    
}
