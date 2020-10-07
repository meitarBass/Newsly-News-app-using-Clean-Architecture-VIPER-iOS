//
//  CategoriesTableViewManager.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

struct Appearance {
    let rowHeight: CGFloat = 48.0
}

protocol CategoriesTableViewManagerProtocol {
    func setUpTableView(tableView: UITableView)
}

class CategoriesTableViewManager: NSObject {

    weak var tableView: UITableView?
    weak var delegate: CategoriesTableViewManagerDelegate?
    
    let appearance = Appearance()
}

extension CategoriesTableViewManager: CategoriesTableViewManagerProtocol {
    
    func setUpTableView(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(SourcesTableViewCell.self, forCellReuseIdentifier: SourcesTableViewCell.identifier)
    }
}

extension CategoriesTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return appearance.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sourceSelected(at: indexPath.row)
    }
}

extension CategoriesTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SourcesTableViewCell.identifier, for: indexPath) as? SourcesTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = CategoriesCellViewModel(category: Categories.categories[indexPath.row].rawValue)
        cell.accessoryType = .disclosureIndicator
        cell.categoryViewModel = cellViewModel
        return cell
    }


}
