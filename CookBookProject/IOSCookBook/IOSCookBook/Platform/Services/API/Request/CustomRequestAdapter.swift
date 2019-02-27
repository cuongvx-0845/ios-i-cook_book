//
//  CustomRequestAdapter.swift

import Foundation
import Alamofire

final class CustomRequestAdapter: RequestAdapter {
    private let userDefault = UserDefaults()
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if let accessToken = userDefault.string(forKey: Constants.keyAccessToken) {
            urlRequest.setValue(accessToken, forHTTPHeaderField: "X-AccessToken")
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}
