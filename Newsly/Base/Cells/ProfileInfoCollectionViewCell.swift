//
//  ProfileInfoCollectionViewCell.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 10.10.2020.
//

import UIKit

protocol ProfileInfoCollectionViewCellDelegate: class {
    func addPhotoTapped()
    var delegate: FavouritesCollectionViewManagerDelegate? { get set }
}

protocol ProfileInfoCollectionViewCellProtocol {
    func updateImage(Image: UIImage?)
    func updateUserInfo(name: String?, email: String?)
    func setupSearchbar()
}

extension ProfileInfoCollectionViewCell {
    struct Appearance {
        let searchBarConstraint: CGFloat = 16.0
        let labelFont: UIFont = .semiboldItalic22
        let labelColor: UIColor = .textColorBlack
        
        static let imageHeight: CGFloat = 100.0
        static let searchBarHeight: CGFloat = 40.0
        static let searchBarTopMargin: CGFloat = 8.0
        static let imageTopMarging: CGFloat = 16.0
    }
}

class ProfileInfoCollectionViewCell: UICollectionViewCell {
    
    
    private let appearance = Appearance()
    weak var delegate: ProfileInfoCollectionViewCellDelegate?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.font: UIFont.semiboldItalic16]
        searchBar.barTintColor = .background
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        return label
    }()
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .cyan
        imageView.layer.cornerRadius = ProfileInfoCollectionViewCell.Appearance.imageHeight / 2
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.image = UIImage.tabBarItems.categories
        return imageView
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        makeConstraints()
        
        // MARK: Delete this line
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubviews()
        self.backgroundColor = .clear
        makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(profileImage)
        self.contentView.addSubview(labelStack)
        self.contentView.addSubview(searchBar)
    }
    
    @objc private func profileImageTapped() {
        delegate?.addPhotoTapped()
    }
    
    private func makeConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(ProfileInfoCollectionViewCell.Appearance.searchBarTopMargin)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(ProfileInfoCollectionViewCell.Appearance.searchBarHeight)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(ProfileInfoCollectionViewCell.Appearance.imageTopMarging)
            make.leading.equalTo(16.0)
            make.height.width.equalTo(ProfileInfoCollectionViewCell.Appearance.imageHeight)
        }
        
        labelStack.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImage.snp.centerY)
            make.trailing.greaterThanOrEqualTo(16.0)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }

    }
    
}

extension ProfileInfoCollectionViewCell: ProfileInfoCollectionViewCellProtocol {
    func setupSearchbar() {
        self.delegate?.delegate?.searchBarManager?.setUpSearchBar(searchBar: self.searchBar)
    }

    func updateUserInfo(name: String?, email: String?) {
        emailLabel.text = email
        nameLabel.text = name
    }
    
    func updateImage(Image: UIImage?) {
        profileImage.image = Image
    }
}

