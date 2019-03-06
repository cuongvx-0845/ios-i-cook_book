//
//  CategoryRequest

import Foundation

final class CategoryRequest: BaseRequest {
    
    required init() {
        super.init(url: URLs.category, requestType: .get, body: nil)
    }
}
