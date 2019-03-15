//
//  AppNavigator.swift

import Foundation

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let mealViewController = MealViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: mealViewController)
        let navigator = MealNavigator(navigationController: navigationController)
        let useCase = MealUseCase()
        let viewModel = MealViewModel(navigator: navigator, useCase: useCase)

        mealViewController.bindViewModel(to: viewModel)
        window.rootViewController = navigationController
    }
}
