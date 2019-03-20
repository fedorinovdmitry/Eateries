import UIKit

protocol WorkWithUIAlertControllersFactory {
    func showSimpleAlert(title: String, message: String)
    func showEateryCellAlert(cell: EateriesTableViewCell, index: Int)
}

class WorkWithUIAlertControllers: WorkWithUIAlertControllersFactory {
    
    // MARK: - Public Properties

    private let viewController: UIViewController
    
    // MARK: - Private Properties
    
    // MARK: - Init
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Public methods
    
    func showSimpleAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        addAlertOnView(allertController: alertController)
    }
    
    func showEateryCellAlert(cell: EateriesTableViewCell, index: Int) {
        let alertController = UIAlertController(title: nil, message: "Выберете действие", preferredStyle: .actionSheet)
        alertController.view.backgroundColor = .gray
        let str: String = {
            var str = ""
            for _ in 0...8 {
                str += String(index)
            }
            return str
        }()
        let call = UIAlertAction(title: "Позвонить: \(str)",
                                 style: .default) { [weak self] (_) in
            guard let workWithAC = self else { return }
            workWithAC.showAlertCallError()
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let isVisited = UIAlertAction(title: "Я был здесь", style: .default) { (_) in
            cell.accessoryType = .checkmark
        }
        alertController.addActions(actions: [call, cancel, isVisited])
        addAlertOnView(allertController: alertController)
    }
    
    func showAlertCallError() {
        let alertController = UIAlertController(title: nil,
                                                message: "Вызов не возможен",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.addAlertOnView(allertController: alertController)
    }
    
    // MARK: - Private methods

    private func addAlertOnView(allertController: UIAlertController) {
        DispatchQueue.main.async(execute: { [weak self] in
            guard let workWitchAC = self else { return }
            workWitchAC.viewController.present(allertController, animated: true, completion: nil)
        })
    }
    
}

// MARK: - UIALertControllerExtension

extension UIAlertController {
    func addActions(actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}
