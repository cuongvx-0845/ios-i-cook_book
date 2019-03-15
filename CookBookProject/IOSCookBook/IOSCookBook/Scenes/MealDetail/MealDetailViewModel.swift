//
//  MealDetailViewModel.swift

import Foundation

struct MealDetailViewModel {
    let navigator: MealDetailNavigatorType
    let useCase: MealDetailUseCaseType
    let meal: Meal
}

extension MealDetailViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let mealName: Driver<String>
        let mealImage: Driver<String>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: MealDetailViewModel.Input) -> MealDetailViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let mealName = input.loadTrigger
            .map { _ in
                return self.meal.name
            }
        
        let mealImageUrl = input.loadTrigger
            .map { _ in
                return self.meal.avatarURLString
            }
        
        return Output(
            mealName: mealName,
            mealImage: mealImageUrl,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
