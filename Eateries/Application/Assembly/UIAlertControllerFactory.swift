import UIKit

protocol WorkWithUIAlertControllersFactory {
    func showSimpleAlert(title: String, message: String)
    func showEateryCellAlert(index: Int)
}

class WorkWithUIAlertControllers: WorkWithUIAlertControllersFactory {
    
    // MARK: - Constant
    enum ActionType {
        case call
        case cancel
        case isVisited
    }
    
    // MARK: - Public Properties
    
    let viewController: UIViewController
    
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
    
    func showAlertCallError() {
        let alertController = UIAlertController(title: nil,
                                                message: "Вызов не возможен",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.addAlertOnView(allertController: alertController)
    }
    
    // MARK: - Private methods
    
    func addAlertOnView(allertController: UIAlertController) {
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
