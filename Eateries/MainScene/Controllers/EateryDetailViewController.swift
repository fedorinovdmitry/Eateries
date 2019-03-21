//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 21/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController {

    // MARK: - Custom types
    
    // MARK: - Constants
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public Properties
    
    var eatery: Eatery?
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configImageView()
        
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func configImageView() {
        guard let eatery = eatery else { return }
        imageView.image = UIImage(named: eatery.imageName)
    }
    
    // MARK: - Navigation

}
