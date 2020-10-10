//
//  SignUpViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit
import SnapKit

extension SignUpViewController {
    struct Appearance {
        let leadingOffset: CGFloat = 24.0
        let trailingOffset: CGFloat = 24.0
        let topOffset: CGFloat = 36.0
        let bottomOffset: CGFloat = 24.0
        
        let buttonHeight: CGFloat = 48.0
        let textfieldHeight: CGFloat = 48.0
        
        let stacksSpacing: CGFloat = 5.0
        let textToFieldSpacing: CGFloat = 8.0
        
        let buttonRadius: CGFloat = 8.0
        let padding: CGFloat = 8.0
        let imageHeight: CGFloat = 110.0
    }
    
    struct Shadow {
        let opacity: Float = 0.12
        let cornerRadius: CGFloat = 6
        let offSet: CGSize = CGSize(width: 0, height: 2)
        let color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

class SignUpViewController: BaseViewController {
    private lazy var newslyTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Newsly"
        label.textColor = .black
        label.font = .extraBoldItalic48
        label.textAlignment = .center
        return label
    }()
    
    private lazy var profileImage: UIImageView = {
        //TODO: -  change home image
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = appearance.imageHeight / 2
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.image = .profileHolderImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var imageHoldeView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.snp.makeConstraints { make in
            make.height.width.equalTo(appearance.imageHeight)
        }
        return view
    }()
    
    private lazy var createYourProfileLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Create Your Profile"
        label.textColor = .black
        label.font = .mediumItalic32
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Full Name"
        name.textColor = .black
        name.font = .semiboldItalic22
        return name
    }()
    
    private lazy var emailAddressLabel: UILabel = {
        let email = UILabel(frame: .zero)
        email.text = "Email Address"
        email.textColor = .black
        email.font = .semiboldItalic22
        return email
    }()
    
    private lazy var passwordLabel: UILabel = {
        let pw = UILabel(frame: .zero)
        pw.text = "Password"
        pw.textColor = .black
        pw.font = .semiboldItalic22
        return pw
    }()
    
    private lazy var fullNameTF: UITextField = {
        let nameTF = UITextField(frame: .zero)
        nameTF.setUI(shadowOpacity: shadow.opacity, shadowRadius: shadow.cornerRadius, shadowOffset: shadow.offSet, shadowColor: shadow.color, placeHolderText: "E.g George Roll", placeHolderColor: #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1), padding: appearance.padding, font: .semiboldItalic16, backgroundColor: #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1))
        
        nameTF.borderStyle = .roundedRect
        nameTF.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.textfieldHeight)
        }
        nameTF.delegate = self
        nameTF.isUserInteractionEnabled = true
        return nameTF
    }()
    
    private lazy var emailAddressTF: UITextField = {
        let emailTF = UITextField(frame: .zero)
        emailTF.setUI(shadowOpacity: shadow.opacity, shadowRadius: shadow.cornerRadius, shadowOffset: shadow.offSet, shadowColor: shadow.color, placeHolderText: "george.roll@gmail.com", placeHolderColor: #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1), padding: appearance.padding, font: .semiboldItalic16, backgroundColor: #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1))
        
        emailTF.borderStyle = .roundedRect
        emailTF.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.textfieldHeight)
        }
        emailTF.delegate = self
        emailTF.isUserInteractionEnabled = true
        emailTF.autocapitalizationType = .none
        return emailTF
    }()
    
    private lazy var passwordTF: UITextField = {
        let pwTF = UITextField(frame: .zero)
        pwTF.setUI(shadowOpacity: shadow.opacity, shadowRadius: shadow.cornerRadius, shadowOffset: shadow.offSet, shadowColor: shadow.color, placeHolderText: "password", placeHolderColor: #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1), padding: appearance.padding, font: .semiboldItalic16, backgroundColor: #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1))
        
        pwTF.borderStyle = .roundedRect
        pwTF.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.textfieldHeight)
        }
        pwTF.delegate = self
        pwTF.isSecureTextEntry = true
        pwTF.autocapitalizationType = .none
        return pwTF
    }()
    
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = appearance.buttonRadius
        button.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.07058823529, alpha: 1)
        button.setTitle("Create Your Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiboldItalic16
        button.addTarget(self, action: #selector(doneCreatingAccount), for: .touchUpInside)
        button.clipsToBounds = true
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.buttonHeight)
        }
        return button
    }()
    
    private lazy var alreadyHaveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Already have an account?", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7254901961, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.titleLabel?.font = .semiboldItalic16
        button.addTarget(self, action: #selector(alreadyHaveAccount), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var titleStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [newslyTitleLabel,
                                                      createYourProfileLabel])
        stackView.distribution = .equalSpacing
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var imageStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [imageHoldeView])
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTF,
                                                       emailAddressLabel, emailAddressTF,
                                                       passwordLabel, passwordTF])
        stackView.distribution = .fillEqually
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [createAccountButton,
                                                      alreadyHaveButton])
        stackView.distribution = .equalSpacing
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
//        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var signUpStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleStackView,
                                                      imageStackView,
                                                      formStackView,
                                                      buttonStackView])
        stackView.distribution = .fillProportionally
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let appearance = Appearance()
    let shadow = Shadow()
    
    var presenter: SignUpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.addKeyBoardObserver()
        view.backgroundColor = .background
        addSubViews()
        makeConstraints()
    }
    
    override func addSubViews() {
        super.addSubViews()
        view.addSubview(signUpStackView)
        imageHoldeView.addSubview(profileImage)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        signUpStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(appearance.topOffset)
            make.bottom.equalToSuperview().inset(appearance.bottomOffset)
            make.leading.equalToSuperview().offset(appearance.leadingOffset)
            make.trailing.equalToSuperview().inset(appearance.trailingOffset)
        }
        
        profileImage.snp.makeConstraints { make in
            make.height.width.equalTo(imageHoldeView.snp.height)
            make.center.equalToSuperview()
        }
        
    }
    
    @objc private func alreadyHaveAccount() {
        presenter?.alreadyHaveAccount()
    }
    
    @objc private func profileImageTapped() {
        presenter?.addPhotoTapped()
    }
    
    @objc private func doneCreatingAccount() {
        presenter?.register(email: emailAddressTF.text, password: passwordTF.text, image: profileImage.image, fullName: fullNameTF.text)
    }
    
    
    override func handleTapGesture() {
        view.frame.origin.y = 0
    }
    
    override func handleKeyboardHeight(rect: CGRect) {
        let errorSpace: CGFloat = 5.0
        if rect.origin.y < formStackView.frame.maxY + self.appearance.topOffset {
            view.frame.origin.y = ((rect.origin.y - (formStackView.frame.maxY + self.appearance.topOffset + errorSpace)))
        }
    }
}

extension SignUpViewController: SignUpViewInput {
    func updateImage(image: UIImage) {
        profileImage.image = image
    }
    
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
