//
//  UIViewController+.swift

import Foundation
import UIKit

extension UIViewController {
    
    func showError(message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: "Error",
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
