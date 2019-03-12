//
//  CategoryNavigator.swift

import Foundation
import UIKit

protocol CategoryNavigatorType {
    func toCategoryDetail(category: Category)
}

struct CategoryNavigator: CategoryNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toCategoryDetail(category: Category) {
        let viewController = CategoryDetailViewController.instantiate()
        let useCase = CategoryDetailUseCase()
        let navigator = CategoryDetailNavigator(navigationController: navigationController)
        let viewModel = CategoryDetailViewModel(navigator: navigator,
                                                useCase: useCase,
                                                category: category)
        
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
