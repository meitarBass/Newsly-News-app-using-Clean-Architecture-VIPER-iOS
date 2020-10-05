//
//  DiscoverPresenterProtocols.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation


// view to presenter
protocol DiscoverPresenterProtocol: class {
    func viewDidLoad()
    
}

//interactor to presenter
protocol DiscoverPresenterInput: class {
   
}


//manager to presenter
protocol DiscoverCollectionViewManagerDelegate: class {
    
}
