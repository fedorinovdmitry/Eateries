//
//  ShowEateryAlert.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 20/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import Foundation
import UIKit

// MARK: - EeteryCellAlertConfiguration methods

extension WorkWithUIAlertControllers {
    
    enum ActionType {
        case call
        case cancel
        case isVisited
        case goDetail
    }
    
    func showEateryCellAlert(index: Int) {
        
        let alertController = UIAlertController(title: nil, message: "Выберете действие", preferredStyle: .actionSheet)
        
        guard let call = getAction(type: .call, index: index),
              let cancel = getAction(type: .cancel, index: index),
              let isVisited = getAction(type: .isVisited, index: index),
              let goDetail = getAction(type: .goDetail, index: index)
            else { return }
        
        alertController.addActions(actions: [goDetail, call, cancel, isVisited])
        addAlertOnView(allertController: alertController)
    }
    
    private func addCheckMark(index: Int) {
        guard let tableViewController = self.viewController as? EateriesTableViewController
            else { return }
        
        tableViewController.eateriesIsVisited[index] = !tableViewController.eateriesIsVisited[index]
        tableViewController.tableView.reloadData()
    }
    
    private func createGoDetailAction(index: Int) -> UIAlertAction? {
        let goDetail = UIAlertAction(title: "Подробнее о ресторане", style: .default) { [weak self] (_) in
            guard let workWithAC = self,
                  let eateryTVC = workWithAC.viewController as? EateriesTableViewController else { return }
            
            eateryTVC.goToDetail()
           
        }
        return goDetail
    }
    
    private func createCallAction(index: Int) -> UIAlertAction {
        // собираем рандомный номер из номера ячейки
        let str: String = {
            var str = ""
            for _ in 0...8 {
                str += String(index)
            }
            return str
        }()
        
        let call = UIAlertAction(title: "Позвонить: \(str)", style: .default) { [weak self] (_) in
            guard let workWithAC = self else { return }
            workWithAC.showAlertCallError()
        }
        return call
    }
    
    private func createIsVisitedAction(index: Int) -> UIAlertAction? {
        guard let eateryTVC = viewController as? EateriesTableViewController else { return nil  }
        
        let isVistedTitle = eateryTVC.eateriesIsVisited[index] ? "Я не был здесь" : "Я был здесь"
        let isVisited = UIAlertAction(title: isVistedTitle, style: .default) { [weak self](_) in
            guard let workWithAC = self else { return }
            workWithAC.addCheckMark(index: index)
        }
        return isVisited
    }
    
    private func getAction(type: ActionType, index: Int) -> UIAlertAction? {
        switch type {
        case .call:
            return createCallAction(index: index)
        case .cancel:
            return UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        case .isVisited:
            return createIsVisitedAction(index: index)
        case .goDetail:
            return createGoDetailAction(index: index)
        }
    }
}
