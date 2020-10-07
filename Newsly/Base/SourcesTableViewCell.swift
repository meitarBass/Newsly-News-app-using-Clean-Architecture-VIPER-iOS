//
//  SourcesTableViewCell.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit
import SnapKit

struct SourcesCellViewModel {
    let sources: Sources?
}

struct CategoriesCellViewModel {
    let category: String?
}

extension SourcesTableViewCell {
    struct Appearance {
        let sourceNameFont: UIFont = .boldItalic18
    }
}


class SourcesTableViewCell: UITableViewCell {

    var viewModel: SourcesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            sourceNameLabel.text = viewModel.sources?.name
        }
    }

    var categoryViewModel: CategoriesCellViewModel? {
        didSet {
            guard let viewModel = categoryViewModel else { return }
            sourceNameLabel.text = categoryViewModel?.category
        }
    }
    
    private let appearance = Appearance()
    
    private lazy var sourceNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = self.appearance.sourceNameFont
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(sourceNameLabel)
    }
    
    private func makeConstraints() {
        sourceNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(16)
        }
    }
}
