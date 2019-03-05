//
//  CategoryRepoRepository.swift

import Foundation

protocol CategoryRepoRepositoryType {
    func getCategoryRepos(input: CategoryRepoRequest) -> Observable<[CategoryRepo]>
}

final class CategoryRepoRepository: CategoryRepoRepositoryType {
    private let api: APIService = APIService.share
    
    func getCategoryRepos(input: CategoryRepoRequest) -> Observable<[CategoryRepo]> {
        return api.request(input: input)
            .map { (response: CategoryRepoResponse) -> [CategoryRepo] in
                return response.categoryRepos
            }
    }
}
