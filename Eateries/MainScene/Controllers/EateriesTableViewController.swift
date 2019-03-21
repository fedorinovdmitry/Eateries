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
    
    var eateriesArr = Eatery.getAllEateries()
    
    // MARK: - Outlets
    
    // MARK: - Public Properties
    
    lazy var workWithUIAlertControllers = DependsFactory.sharedInstance.makeWorkWithUIAlertController(viewConroller: self)
    
    // MARK: - Private Properties
    
    // сохраняем индекспаз последней выбранной ячеки для осуществления возможно перехода
    private var lastSelectedRowIndexPath: IndexPath?
    
    // MARK: - Init
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // чтобы контент из таблицы не накладывался на статус бар
        (UIApplication.shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = view.backgroundColor
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
        cell.accessoryType = self.eateriesArr[indexPathRow].isVisited ? .checkmark : .none
        return cell
    }
    // MARK: - Navigation
    
    let segueToDetailID = "detailSegue"
    
    func goToDetail() {
        performSegue(withIdentifier: segueToDetailID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailID {
            guard let indexPath = lastSelectedRowIndexPath,
                  let detailVC = segue.destination as? EateryDetailViewController
                else { return }
            let index = indexPath.row
            detailVC.eatery = eateriesArr[index]
        }
    }
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
        // убираем select ячейки но сохраняем ее index для перехода
        lastSelectedRowIndexPath = indexPath
    }
    
    // методы изменения ячейки
    override func tableView(_ tableView: UITableView,
                            editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default,
                                         title: "Поделиться") { [weak self] (_, indexPath) in
            guard let tVC = self else { return }
            let index = indexPath.row
            let defaultText = "Я сейчас в " + tVC.eateriesArr[index].name
            if let image = UIImage(named: tVC.eateriesArr[index].imageName) {
                let activityController =
                    UIActivityViewController(activityItems: [defaultText, image],
                                             applicationActivities: nil)
                
                tVC.present(activityController, animated: true, completion: nil)
                
            }
        }
        
        let delete =
            UITableViewRowAction(style: .default,
                                          title: "Удалить") { [weak self] (_, indexPath) in
            guard let tVC = self else { return }
            let index = indexPath.row
            tVC.eateriesArr.remove(at: index)
            tVC.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        share.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        return [delete, share]

    }

}
