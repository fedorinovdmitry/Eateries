//
//  NavigationBarConfig.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 22/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

extension AppDelegate {
    func configUINavigationBarApp() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        if let barFont = UIFont(name: "AppleSDGothicNeo-Light", size: 24) {
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: barFont ]
        }
        
    }
}
