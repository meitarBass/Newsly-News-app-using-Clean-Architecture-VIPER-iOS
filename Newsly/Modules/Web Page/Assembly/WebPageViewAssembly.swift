//
//  WebViewAssembly.swift
//  Newsly
//
//  Created by Meitar Basson on 08/10/2020.
//

import UIKit

class WebPageViewAssembly {
    public static func assemble(urlString: String?) -> UIViewController {
        let view = WebPageViewController()
        view.urlString = urlString
        
        return view
    }
}
