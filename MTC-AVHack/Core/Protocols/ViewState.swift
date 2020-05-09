//
//  ViewState.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 08/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

protocol ViewState: class {
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDissappear()
}

extension ViewState {
    
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDissappear() {}
}
