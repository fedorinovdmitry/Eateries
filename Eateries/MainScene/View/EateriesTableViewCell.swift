//
//  EateriesTableViewCell.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 15/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

class EateriesTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identefier = "eateriesCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLable: UILabel!

}
