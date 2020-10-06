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
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension SourcesViewController: SourcesViewInput {
    
}
