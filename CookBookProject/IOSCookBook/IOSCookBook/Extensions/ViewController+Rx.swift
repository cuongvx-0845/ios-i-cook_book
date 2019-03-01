//
//  ViewController+.swift

import Foundation

private struct constants {
    static let hudOffsetY: CGFloat = -25
}

extension Reactive where Base: UIViewController {

    var error: Binder<Error> {
        return Binder(base) { viewController, error in
            viewController.showError(message: error.localizedDescription)
        }
    }
    
    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                hud.offset.y = constants.hudOffsetY
            } else {
                MBProgressHUD.hide(for: viewController.view, animated: true)
            }
        }
    }
}
