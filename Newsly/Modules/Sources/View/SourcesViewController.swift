//
//  SourcesViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

class SourcesViewController: BaseViewController {
    
    var presenter: SourcesPresenterProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private lazy var refreshController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(userPulledView), for: .valueChanged)
        refreshControl.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        return refreshControl
    }()
    
    @objc private func userPulledView() {
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        presenter?.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        addSubViews()
        makeConstraints()
        self.presenter?.tableViewManager?.setUpTableView(tableView: self.tableView)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(tableView)
        self.tableView.refreshControl = refreshController
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func hideActivityIndicator() {
        super.hideActivityIndicator()
        self.refreshController.endRefreshing()
    }
    
}

extension SourcesViewController: SourcesViewInput {
    
}
