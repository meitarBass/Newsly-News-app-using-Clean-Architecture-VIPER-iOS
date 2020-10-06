//
//  SourcesTableViewCell.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit
import SnapKit
import Kingfisher


struct SourcesCellViewModel {
    let sources: Sources?
}

extension SourcesTableViewCell {
    struct Appearance {
        let sourceNameFont: UIFont = .boldItalic16
    }
}


class SourcesTableViewCell: UITableViewCell {

    var viewModel: SourcesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            sourceNameLabel.text = viewModel.sources?.name
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

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpUI()
//    }

    
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
