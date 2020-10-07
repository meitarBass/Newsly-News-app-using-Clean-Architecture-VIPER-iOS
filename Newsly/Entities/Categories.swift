//
//  Categories.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

struct Categories {
    static let categories: [categories] = [.business, .entertainment, .general, .health, .science, .sports, .technology]
}

enum categories: String {
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
}
