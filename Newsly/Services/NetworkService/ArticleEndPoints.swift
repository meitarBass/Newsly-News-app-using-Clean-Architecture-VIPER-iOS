//
//  ArticleEndPoints.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation

enum ArticleEndpoint: EndPointProtocol {
    
    case getTopHeadlines
    case getArticlesFromCategory(_ category: String)
    case getSources
    case getArticlesFromSource(_ source: String)
    case searchForArticles(searchFilter: String)
    
    private var baseURL: String {
        return "https://newsapi.org/v2"
    }
    
    private var absoluteURL: String {
        switch self {
        case .getTopHeadlines, .getArticlesFromCategory:
            return baseURL + "/top-headlines?"
        case .getSources:
            return baseURL + "/sources?"
        case .getArticlesFromSource, .searchForArticles:
            return baseURL + "/everything?"
        }
    }
    
    var completeURL: String {
        switch self {
        case .getTopHeadlines:
            return self.absoluteURL + "Country=" + self.region + "&ApiKey=" + self.APIKey
        case let .getArticlesFromCategory(category):
            return self.absoluteURL + "Country=" + self.region + "&Category=" + category + "&ApiKey=" + self.APIKey
        case .getSources:
            return self.absoluteURL + "language=" + self.locale + "&Country=" + self.region + "&ApiKey=" + self.APIKey
        case let .getArticlesFromSource(source):
            return self.absoluteURL + "sources=" + source + "&language=" + self.locale + "&ApiKey=" + self.APIKey
        case let .searchForArticles(filter):
            print(self.absoluteURL + "q=" + filter + "&language=" + self.locale + "&ApiKey=" + self.APIKey)
            return self.absoluteURL + "q=" + filter + "&language=" + self.locale + "&ApiKey=" + self.APIKey
        }
    
    
}








}
