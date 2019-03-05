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
        let repos: Driver<[CategoryRepo]>
        let selected: Driver<Void>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: MainViewModel.Input) -> MainViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let repos = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getRepos()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }
        
        let selected = input.selectTrigger?
            .withLatestFrom(repos) { indexPath, repos in
                return repos[indexPath.row]
            }
            .do(onNext: { repo in
                self.navigator.toRepoDetail(categoryRepo: repo)
            })
            .mapToVoid()
        
        return Output(
            repos: repos,
            selected: selected,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
