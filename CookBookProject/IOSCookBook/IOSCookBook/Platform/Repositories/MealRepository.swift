//
//  MealRepository.swift

import Foundation

protocol MealRepositoryType {
    func getMeals(input: MealRequest) -> Observable<[Meal]>
}

final class MealRepository: MealRepositoryType {
    private let api: APIService = APIService.share
    
    func getMeals(input: MealRequest) -> Observable<[Meal]> {
        return api.request(input: input)
            .map { (response: MealResponse) -> [Meal] in
                return response.meals
        }
    }
}
