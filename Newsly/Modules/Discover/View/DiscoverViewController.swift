//
//  DiscoverViewController.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

class DiscoverViewController: BaseViewController {

    var presenter: DiscoverPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


extension DiscoverViewController: DiscoverViewInput {
    
}
