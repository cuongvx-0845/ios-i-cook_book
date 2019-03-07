//
//  CategoryUseCase.swift

import Foundation

protocol MainUseCaseType {
    func getCategories() -> Observable<[Category]>
}

struct CategoryUseCase: MainUseCaseType {
    
    func getCategories() -> Observable<[Category]> {
        let request = CategoryRequest()
        let repository = CategoryRepository()
        return repository.getCategories(input: request)
    }
}
