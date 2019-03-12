//
//  CategoryDetailViewModel.swift

import Foundation

struct CategoryDetailViewModel {
    let navigator: CategoryDetailNavigatorType
    let useCase: CategoryDetailUseCaseType
    let category: Category
}

extension CategoryDetailViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let categoryName: Driver<String>
        let categoryImage: Driver<String>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: CategoryDetailViewModel.Input) -> CategoryDetailViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let repoName = input.loadTrigger
            .map { _ in
                return self.category.name
            }
        
        let repoImageUrl = input.loadTrigger
            .map { _ in
                return self.category.avatarURLString
            }
        
        return Output(
            categoryName: repoName,
            categoryImage: repoImageUrl,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
