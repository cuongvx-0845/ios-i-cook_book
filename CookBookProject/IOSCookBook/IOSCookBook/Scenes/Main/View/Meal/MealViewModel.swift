//
//  MealViewModel.swift

import Foundation

struct MealViewModel {
    let navigator: MealNavigatorType
    let useCase: MealUseCaseType
}

extension MealViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let meals: Driver<[Meal]>
        let selected: Driver<Void>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: MealViewModel.Input) -> MealViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let meals = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getMeals()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
        }
        
        let selected = input.selectTrigger
            .withLatestFrom(meals) { indexPath, meals in
                return meals[indexPath.row]
            }
            .do(onNext: { meal in
                self.navigator.toMealDetail(meal: meal)
            })
            .mapToVoid()
        
        return Output(
            meals: meals,
            selected: selected,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}

