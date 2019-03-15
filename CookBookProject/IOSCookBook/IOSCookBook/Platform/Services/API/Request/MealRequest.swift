//
//  MealRequest.swift

import Foundation

final class MealRequest: BaseRequest {
    
    required init() {
        super.init(url: URLs.meal, requestType: .get, body: nil)
    }
}

