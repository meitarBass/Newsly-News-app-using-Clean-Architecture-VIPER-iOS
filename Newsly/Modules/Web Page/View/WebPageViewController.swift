//
//  WebPageViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 08/10/2020.
//

import UIKit
import WebKit
import SnapKit

// MARK: Move to WebPageViewInput file

protocol WebPageViewProtocol {
//    func presentAlert(title: String, message: String, alert: ActionAlertModel)
}

class WebPageViewController: BaseViewController {
    
    // MARK: Need to add a star button for favourite
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return webView
    }()
    
    private lazy var favouriteButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favouriteButtonTapped))
//        barButtonItem.image
        return barButtonItem
    }()
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        loadWebView()
        navigationItem.rightBarButtonItem = favouriteButton
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(webView)
    }
    
    private func loadWebView() {
        guard let urlString = self.urlString, let url = URL(string: urlString)
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @objc private func favouriteButtonTapped() {
        print("Favourite!")
    }
}

extension WebPageViewController: WebPageViewProtocol {
    func presentAlert(title: String, message: String, alert: ActionAlertModel) {
        
    }
}
