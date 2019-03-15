//
//  MealUseCase.swift

import Foundation

protocol MealUseCaseType {
    func getMeals() -> Observable<[Meal]>
}

struct MealUseCase: MealUseCaseType {
    
    func getMeals() -> Observable<[Meal]> {
        let request = MealRequest()
        let repository = MealRepository()
        return repository.getMeals(input: request)
    }
}
