//
//  SourceInteractorProtocol.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

protocol SearchInteractorInput: class {
    func fetchSearchedArticles(filter: String)
}
