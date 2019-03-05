//
//  CategoryRepo

import Foundation

struct CategoryRepo {
    var categoryName: String
    var avatarURLString: String
    var categoryDescription: String
}

extension CategoryRepo {
    init() {
        self.init(
            categoryName: "",
            avatarURLString: "",
            categoryDescription: ""
        )
    }
}

extension CategoryRepo: BaseModel {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        categoryName <- map["strCategory"]
        avatarURLString <- map["strCategoryThumb"]
        categoryDescription <- map["strCategoryDescription"]
    }
}
