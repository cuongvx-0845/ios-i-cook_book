//
//  CategoryUseCase.swift

import Foundation

protocol CategoryUseCaseType {
    func getCategories() -> Observable<[Category]>
}

struct CategoryUseCase: CategoryUseCaseType {
    
    func getCategories() -> Observable<[Category]> {
        let request = CategoryRequest()
        let repository = CategoryRepository()
        return repository.getCategories(input: request)
    }
}
