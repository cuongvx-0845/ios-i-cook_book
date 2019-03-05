//
//  MainNavigator.swift

import Foundation
import UIKit

protocol MainNavigatorType {
    func toRepoDetail(categoryRepo: CategoryRepo)
}

struct MainNavigator: MainNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toRepoDetail(categoryRepo: CategoryRepo) {
        let viewController = RepoDetailViewController.instantiate()
        let useCase = RepoDetailUseCase()
        let navigator = RepoDetailNavigator(navigationController: navigationController)
        let viewModel = RepoDetailViewModel(navigator: navigator,
                                            useCase: useCase,
                                            repo: CategoryRepo)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
