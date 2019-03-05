//
//  CategoryRepoRequest

import Foundation

final class CategoryRepoRequest: BaseRequest {
    
    required init(page: Int, perPage: Int = 10) {
        let body: [String: Any]  = [
            "q": "language:Rxswift",
            "per_page": perPage,
            "page": page
        ]
        super.init(url: URLs.categoryRepo, requestType: .get, body: body)
    }
}
