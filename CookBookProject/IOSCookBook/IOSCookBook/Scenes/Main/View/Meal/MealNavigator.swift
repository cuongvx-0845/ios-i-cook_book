//
//  MealNavigator.swift

import Foundation
import UIKit

protocol MealNavigatorType {
    func toMealDetail(meal: Meal)
}

struct MealNavigator: MealNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toMealDetail(meal: Meal) {
        let viewController = MealDetailViewController()
        let useCase = MealDetailUseCase()
        let navigator = MealDetailNavigator(navigationController: navigationController)
        let viewModel = MealDetailViewModel(navigator: navigator,
                                                useCase: useCase,
                                                meal: meal)
        
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
