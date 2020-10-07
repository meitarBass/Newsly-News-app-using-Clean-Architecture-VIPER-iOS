//
//  SourcesTableViewManager.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

extension SourcesTableViewManager {
    struct Apperance {
        let cellHeight: CGFloat = 60.0
        let cellInsets: CGFloat = 10.0
        let sourceNameFont: UIFont = .boldItalic18
    }
}

// Presentor to Manager
protocol SourcesTableViewManagerProtocol {
    func setUpTableView(tableView: UITableView)
    func setUpCells(sources: [Sources])
}

class SourcesTableViewManager: NSObject {
    
    weak var delegate: SourcesTableViewManagerDelegate?
    weak var tableView: UITableView?
    
    private var sources: [Sources]?
    private let appearance =  Apperance()
}

extension SourcesTableViewManager: SourcesTableViewManagerProtocol {
    func setUpTableView(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(SourcesTableViewCell.self, forCellReuseIdentifier: SourcesTableViewCell.identifier)
    }
    
    func setUpCells(sources: [Sources]) {
        self.sources = sources
        self.tableView?.reloadData()
    }
    
    
}

extension SourcesTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.appearance.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.sourceSelected(at: indexPath.row)
    }
}

extension SourcesTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SourcesTableViewCell.identifier, for: indexPath) as? SourcesTableViewCell else { return UITableViewCell() }
        let cellViewModel = SourcesCellViewModel(sources: sources?[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        cell.viewModel = cellViewModel
        return cell        
    }
  
}
