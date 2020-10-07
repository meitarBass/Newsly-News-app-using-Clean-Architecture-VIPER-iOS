//
//  ArticlesModel.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 06.10.2020.
//

import Foundation

struct ArticlesModel: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}


struct Source: Codable {
    let name: String?
}

