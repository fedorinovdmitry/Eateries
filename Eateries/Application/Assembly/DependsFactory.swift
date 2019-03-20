//
//  DependsFactory.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 20/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import Foundation
import UIKit

class DependsFactory {
    static let sharedInstance = DependsFactory()
    private init() {}
    
    func makeWorkWithUIAlertController(viewConroller: UIViewController)
        -> WorkWithUIAlertControllersFactory {
        return WorkWithUIAlertControllers(viewController: viewConroller)
    }
    
}
