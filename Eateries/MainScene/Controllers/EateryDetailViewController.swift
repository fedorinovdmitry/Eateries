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
    @IBOutlet weak var tabbleView: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    
    // MARK: - Public Properties
    
    var eatery: Eatery?
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewController
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func configUI() {
        guard let eatery = eatery else { return }
        
        imageView.image = UIImage(named: eatery.imageName)
        
        // это все что идет после ячеек
        tabbleView.tableFooterView = UIView(frame: CGRect.zero)
        tabbleView.estimatedRowHeight = 40
        tabbleView.rowHeight = UITableView.automaticDimension
        title = eatery.name
        
        rateButton.layer.cornerRadius = rateButton.frame.width / 2
        rateButton.layer.borderWidth = 1
        rateButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    private func configCell(cell: EateryDetailViewCell, index: Int) -> EateryDetailViewCell {
        guard let eatery = eatery else { return cell }
        
        switch index {
        case 0:
            cell.keyLabel.text = "Название:"
            cell.valueLabel.text = eatery.name
        case 1:
            cell.keyLabel.text = "Тип:"
            cell.valueLabel.text = eatery.type.rawValue
        case 2:
            cell.keyLabel.text = "Адрес:"
            cell.valueLabel.text = eatery.location
        case 3:
            cell.keyLabel.text = "Я там уже был?:"
            cell.valueLabel.text = eatery.isVisited ? "Да" : "Нет"
        default:
            break
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    // MARK: - Navigation

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
}

extension EateryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EateryDetailViewCell.identifier,
                                                 for: indexPath) as! EateryDetailViewCell // swiftlint:disable:this force_cast
        
        return configCell(cell: cell, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
