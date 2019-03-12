//
//  Category.swift

import Foundation
import ObjectMapper

struct Category {
    var name: String
    var avatarURLString: String
    var description: String
}

extension Category {
    init() {
        self.init(
            name: "",
            avatarURLString: "",
            description: ""
        )
    }
}

extension Category: BaseModel {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["strCategory"]
        avatarURLString <- map["strCategoryThumb"]
        description <- map["strCategoryDescription"]
    }
}
