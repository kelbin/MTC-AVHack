//
//  DeviceAssembly.swift
//  MTC-AVHack
//
//  Created by Ванурин Алексей Максимович on 10.05.2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation
import UIKit

final class DeviceAssembly {
    
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Devices", bundle: nil)
        
        let deviceViewController = storyboard.instantiateViewController(withIdentifier: "DeviceViewController")
        
        return deviceViewController
        
    }
    
}
