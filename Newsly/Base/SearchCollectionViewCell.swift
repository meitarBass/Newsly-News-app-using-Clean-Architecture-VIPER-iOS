//
//  SearchCollectionViewCell.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit
import SnapKit
import Kingfisher

struct SearchCellViewModel {
    let article: Article?
    let titleHeight: CGFloat
    let descriptionHeight: CGFloat
}

extension SearchCollectionViewCell {
    struct Appearance {
        let imageHeight: CGFloat = 250.0
        let seperatorHeight: CGFloat = 2.0
        let titleFont: UIFont = UIFont.boldItalic18
        let descriptionFont: UIFont = UIFont.semibold15
        let labelConstraints: CGFloat = 16.0
        let cornerRadius: CGFloat = 16.0
    }
}

class SearchCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SearchCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.article?.title
            descriptionLabel.text = viewModel.article?.description
            
            titleLabel.snp.makeConstraints { (make) in
                make.height.equalTo(viewModel.titleHeight)
            }
            
            descriptionLabel.snp.makeConstraints { (make) in
                make.height.equalTo(viewModel.descriptionHeight)
            }
            
            image.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            setCellImage(imageUrl: viewModel.article?.urlToImage)
        }
    }
    
    private let appearance = Appearance()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = self.appearance.titleFont
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel(frame: .zero)
        description.font = self.appearance.descriptionFont
        description.numberOfLines = 0
        return description
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = appearance.cornerRadius
        return image
    }()
    
    private lazy var view: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .darkBackground
        view.layer.cornerRadius = appearance.cornerRadius
        return view
    }()
    
    private lazy var seperator: UIView = {
        let seperator = UIView(frame: .zero)
        seperator.backgroundColor = .tintColor
        seperator.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.seperatorHeight)
        }
        return seperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(image)
        self.image.addSubview(view)
        view.addSubview(descriptionLabel)
        view.addSubview(titleLabel)
        view.addSubview(seperator)
    }
    
    
    private func makeConstraints() {
        descriptionLabel.snp.makeConstraints { (make) in
            make.bottom.trailing.equalTo(-appearance.labelConstraints)
            make.leading.equalTo(appearance.labelConstraints)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-appearance.labelConstraints)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-4)
            make.leading.equalTo(appearance.labelConstraints)
        }
        
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        seperator.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
    private func setCellImage(imageUrl: String?) {
        guard let imageUrl = imageUrl else { return }
        if let imageUrl = URL(string: imageUrl) {
            image.kf.indicatorType = .activity
            image.kf.setImage(
                with: imageUrl,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
            ])
        }
    }
}
