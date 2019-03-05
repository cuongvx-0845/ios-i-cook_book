//
//  MainUseCase.swift

import Foundation

protocol MainUseCaseType {
    func getCategories() -> Observable<[Category]>
}

struct MainUseCase: MainUseCaseType {
    
    func getCategories() -> Observable<[Category]> {
        let request = CategoryRequest()
        let repository = CategoryRepository()
        return repository.getCategories(input: request)
    }
}
