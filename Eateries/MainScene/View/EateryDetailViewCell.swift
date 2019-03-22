//
//  EateryDetailViewCell.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 21/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

class EateryDetailViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "eateryDetailCellID"
    
    // MARK: - Outlets
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewCell
    
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
