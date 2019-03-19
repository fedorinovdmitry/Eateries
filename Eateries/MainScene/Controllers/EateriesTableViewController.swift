//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 15/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {

    // MARK: - Custom types
    
    // MARK: - Constants
    
    let eateriesArr = Eatery.getAllEateries()
    
    // MARK: - Outlets
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    // MARK: - Navigation
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eateriesArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EateriesTableViewCell.identefier,
                                          for: indexPath) as! EateriesTableViewCell // swiftlint:disable:this force_cast
        let eatery = eateriesArr[indexPath.row]
        cell.nameLabel.text = eatery.name
        cell.thumbnailImageView.image = UIImage(named: eatery.imageName)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true //позволяет обрезать изображение
        
        return cell
    }

}
