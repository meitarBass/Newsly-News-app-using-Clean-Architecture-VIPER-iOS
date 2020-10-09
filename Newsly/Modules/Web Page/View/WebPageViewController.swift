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
    
    var presenter: WebPagePresenterProtocol?
    
    // MARK: Need to add a star button for favourite
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return webView
    }()
    
    private lazy var favouriteButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favouriteButtonTapped))
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        navigationItem.rightBarButtonItem = favouriteButton
        navigationController?.navigationBar.prefersLargeTitles = false
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
    
    private func loadWebView(urlString: String) {
        guard  let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @objc private func favouriteButtonTapped() {
        presenter?.saveArticle()
    }
}

extension WebPageViewController: WebPageViewInput {
    func changeFavouriteState(state: Bool) {
        print("favouriteButtonState", state)
    }
    
    func showWebPage(url: String) {
        self.loadWebView(urlString: url)
    }
    
    
}
