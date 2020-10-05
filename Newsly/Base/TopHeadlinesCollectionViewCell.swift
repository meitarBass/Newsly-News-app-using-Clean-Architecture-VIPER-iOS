//
//  TopHeadlinesCollectionViewCell.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 06.10.2020.
//

import UIKit
import SnapKit


struct HeadlinesCellViewModel {
    let article: Article?
    let titleHeight: CGFloat
    let descriptionHeight: CGFloat
}

extension TopHeadlinesCollectionViewCell {
    struct Appearance {
        let imageHeight: CGFloat = 150.0
        let titleFont: UIFont = UIFont.boldItalic18
        let descriptionFont: UIFont = UIFont.semibold15
    }
}


class TopHeadlinesCollectionViewCell: UICollectionViewCell {
    
    var viewModel: HeadlinesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.article?.title
            descriptionLabel.text = viewModel.article?.description
            
            titleLabel.snp.updateConstraints { make in
                make.height.equalTo(viewModel.titleHeight)
            }
            
            descriptionLabel.snp.updateConstraints { make in
                make.height.equalTo(viewModel.descriptionHeight)
            }
            
            //use kingfisher
        }
    }
    
    
    private let appearance = Appearance()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = self.appearance.titleFont
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.size.height.equalTo(10.0)
        }
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = self.appearance.descriptionFont
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.size.height.equalTo(10.0)
        }
        return label
    }()
    
    private lazy var image: UIImageView = {
       let image =  UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        
        image.snp.makeConstraints { make in
            make.height.equalTo(self.appearance.imageHeight)
        }
        return image
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, image])
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.axis = .vertical
        return stackView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.contentView.addSubview(contentStackView)
    }
    
    private func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
