//
//  MainUseCase.swift

import Foundation
import MGArchitecture

protocol MainUseCaseType {
    func getRepos() -> Observable<[CategoryRepo]>
}

struct MainUseCase: MainUseCaseType {
    
    func getRepos() -> Observable<[CategoryRepo]> {
        let request = CategoryRepoRequest(page: 1)
        let repository = CategoryRepoRepository()
        return repository.getCategoryRepos(input: request)
    }
}
