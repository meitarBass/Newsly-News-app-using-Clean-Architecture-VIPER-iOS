//
//  TopHeadlinesCollectionViewCell.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 06.10.2020.
//

import UIKit
import SnapKit
import Kingfisher


struct HeadlinesCellViewModel {
    let article: Article?
    let titleHeight: CGFloat
    let descriptionHeight: CGFloat
}

extension TopHeadlinesCollectionViewCell {
    struct Appearance {
        let imageHeight: CGFloat = 250.0
        let seperatorHeight: CGFloat = 4.5
        let titleFont: UIFont = UIFont.extraBold28
        let descriptionFont: UIFont = UIFont.medium14
    }
}


class TopHeadlinesCollectionViewCell: UICollectionViewCell {
    
    var viewModel: HeadlinesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.article?.title
            descriptionLabel.text = viewModel.article?.description
            
            if let imageURL = viewModel.article?.urlToImage {
                
                if imageURL == "null" {
                    imageView.image = UIImage.tabBarItems.source
                } else {
                    setCellImage(imageUrl: imageURL)
                }
            } else {
                imageView.image = UIImage.tabBarItems.source
            }
        }
    }
    
    
    private let appearance = Appearance()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = self.appearance.titleFont
        label.numberOfLines = 0
        label.textColor = .textColorBlack
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = self.appearance.descriptionFont
        label.textColor = .textColorGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       let image =  UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var seperator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .placeHolderTextColor
        view.snp.makeConstraints { (make) in
            make.height.equalTo(self.appearance.seperatorHeight)
        }
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, imageView, seperator])
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.clipsToBounds = true
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
    
    private func setCellImage(imageUrl: String?) {
        guard let imageUrl = imageUrl else { return }
        if let imageUrl = URL(string: imageUrl) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: imageUrl,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
            ])
        }
    }
}
