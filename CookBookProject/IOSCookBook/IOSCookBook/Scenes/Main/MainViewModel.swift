//
//  MainViewModel.swift

import Foundation
import MGArchitecture

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

extension MainViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let categories: Driver<[Category]>
        let selected: Driver<Void>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: MainViewModel.Input) -> MainViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let categories = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getCategories()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }
        
        let selected = input.selectTrigger
            .withLatestFrom(categories) { indexPath, categories in
                return categories[indexPath.row]
            }
            .do(onNext: { category in
                self.navigator.toCategoryDetail(category: category)
            })
            .mapToVoid()
        
        return Output(
            categories: categories,
            selected: selected,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
