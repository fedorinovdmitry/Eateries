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
    lazy var eateriesIsVisited = [Bool](repeating: false, count: eateriesArr.count)
    
    // MARK: - Outlets
    
    // MARK: - Public Properties
    
    lazy var workWithUIAlertControllers = DependsFactory.sharedInstance.makeWorkWithUIAlertController(viewConroller: self)
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func configEateryCell(cell: EateriesTableViewCell, indexPathRow: Int) -> EateriesTableViewCell {
        let eatery = eateriesArr[indexPathRow]
        cell.nameLabel.text = eatery.name
        cell.thumbnailImageView.image = UIImage(named: eatery.imageName)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true //позволяет обрезать изображение
        cell.accessoryType = self.eateriesIsVisited[indexPathRow] ? .checkmark : .none
        return cell
    }
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
        return configEateryCell(cell: cell, indexPathRow: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        workWithUIAlertControllers.showEateryCellAlert(index: indexPath.row)
        // убирает выбор ячейки, подсветку неприятную
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
