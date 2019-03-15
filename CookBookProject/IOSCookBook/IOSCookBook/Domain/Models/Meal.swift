//
//  Meal.swift

import Foundation
import ObjectMapper

struct FoodResource {
    var ingredient = ""
    var measure = ""
}

struct Constants {
    static let endArray = 20
}

struct Meal {
    var name: String
    var area: String
    var ofCategory: String
    var instructions: String
    var avatarURLString: String
    var resources: [FoodResource]
}

extension Meal {
    init() {
        self.init(
            name: "",
            area: "",
            ofCategory: "",
            instructions: "",
            avatarURLString: "",
            resources: [FoodResource]()
        )
    }
}

extension Meal: BaseModel {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["strMeal"]
        area <- map["strArea"]
        ofCategory <- map["strCategory"]
        instructions <- map["strInstructions"]
        avatarURLString <- map["strMealThumb"]
        (1...Constants.endArray).forEach { index in
            var ingredient = ""
            var measure = ""
            ingredient <- map["strIngredient\(index)"]
            measure <- map["strMeasure\(index)"]
            if ingredient.isEmpty {
                resources.append(FoodResource(ingredient: ingredient, measure: measure))
            }
        }
    }
}
