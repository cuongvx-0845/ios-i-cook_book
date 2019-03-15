//
//  URLs.swift

import Foundation

struct URLs {
    private static let APIBaseUrl = "https://www.themealdb.com/api/json/v1/1/"
    public static let meal = APIBaseUrl + "search.php?s"
    public static let category = APIBaseUrl + "categories.php"
}
