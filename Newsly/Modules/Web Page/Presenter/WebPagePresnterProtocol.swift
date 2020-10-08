//
//  WebPagePresnterProtocol.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation



// View To Presenter
protocol WebPagePresenterProtocol: class {
   func viewDidLoad()
}

// Interactor To Presenter
protocol WebPagePresenterInput: class {
}

//
protocol WebPageTextFieldsManagerDelegate: class {
}
