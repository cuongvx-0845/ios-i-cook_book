//
//  AppNavigator.swift

import Foundation

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let viewController = CategoryViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = MainNavigator(navigationController: navigationController)
        let useCase = CategoryUseCase()
        let viewModel = CategoryViewModel(navigator: navigator, useCase: useCase)

        viewController.bindViewModel(to: viewModel)
        window.rootViewController = navigationController
    }
}
