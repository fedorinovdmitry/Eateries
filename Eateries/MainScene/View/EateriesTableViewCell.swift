//
//  EateriesTableViewCell.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 15/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

class EateriesTableViewCell: UITableViewCell {

    // MARK: - Custom types
    
    // MARK: - Constants
    
    static let identefier = "eateriesCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - UITableViewCell methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    // MARK: - Navigation

}
