//
//  MealResponse.swift

import Foundation
import ObjectMapper

final class MealResponse: Mappable {
    var meals = [Meal]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        meals <- map["meals"]
    }
}
