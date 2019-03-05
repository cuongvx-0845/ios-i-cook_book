//
//  CategoryRepoResponse.swift

import Foundation

final class CategoryRepoResponse : Mappable {
    var categoryRepos = [CategoryRepo]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        categoryRepos <- map["categories"]
    }
}
