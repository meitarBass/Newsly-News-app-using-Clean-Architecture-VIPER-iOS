//
//  LoginViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit
import SnapKit

extension LoginViewController {
    struct Appearance {
        let leadingOffset: CGFloat = 24.0
        let trailingOffset: CGFloat = -24.0
        let topOffset: CGFloat = 24.0
        let bottomOffset: CGFloat = -24.0
        
        let buttonHeight: CGFloat = 48.0
        let textfieldHeight: CGFloat = 48.0
        
        let stacksSpacing: CGFloat = 16.0
        let textToFieldSpacing: CGFloat = 8.0
        
        let buttonRadius: CGFloat = 8.0
        let padding: CGFloat = 8.0
    }
    
    struct Shadow {
        let opacity: Float = 0.12
        let cornerRadius: CGFloat = 6
        let offSet: CGSize = CGSize(width: 0, height: 2)
        let color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

class LoginViewController: BaseViewController {
    
    var presenter: SignInPresenterProtocol?
    
    private lazy var newslyTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Newsly"
        label.textColor = .black
        label.font = .extraBoldItalic48
        label.textAlignment = .center
        return label
    }()
    
    private lazy var createYourProfileLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Login to Your Profile"
        label.textColor = .black
        label.font = .mediumItalic32
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailAddressLabel: UILabel = {
        let email = UILabel(frame: .zero)
        email.text = "Email Address"
        email.textColor = .black
        email.font = .semiboldItalic22
        return email
    }()
    
    private lazy var emailAddressTF: UITextField = {
        let emailTF = UITextField(frame: .zero)
        emailTF.setUI(shadowOpacity: shadow.opacity, shadowRadius: shadow.cornerRadius, shadowOffset: shadow.offSet, shadowColor: shadow.color, placeHolderText: "george.roll@gmail.com", placeHolderColor: #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1), padding: appearance.padding, font: .semiboldItalic16, backgroundColor: #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1))
        
        emailTF.borderStyle = .roundedRect
        emailTF.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.textfieldHeight)
        }
        
        emailTF.isUserInteractionEnabled = true
        return emailTF
    }()
    
    private lazy var passwordLabel: UILabel = {
        let pw = UILabel(frame: .zero)
        pw.text = "Password"
        pw.textColor = .black
        pw.font = .semiboldItalic22
        return pw
    }()

    private lazy var passwordTF: UITextField = {
        let pwTF = UITextField(frame: .zero)
        pwTF.setUI(shadowOpacity: shadow.opacity, shadowRadius: shadow.cornerRadius, shadowOffset: shadow.offSet, shadowColor: shadow.color, placeHolderText: "password", placeHolderColor: #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1), padding: appearance.padding, font: .semiboldItalic16, backgroundColor: #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1))
        
        pwTF.borderStyle = .roundedRect
        pwTF.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.textfieldHeight)
        }
        
        pwTF.isSecureTextEntry = true
        
        return pwTF
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = appearance.buttonRadius
        button.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.07058823529, alpha: 1)
        button.setTitle("Login to Your Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiboldItalic16
        button.addTarget(self, action: #selector(loginToYourAccount), for: .touchUpInside)
        button.clipsToBounds = true
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.buttonHeight)
        }
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Forgot Your Password?", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7254901961, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.titleLabel?.font = .semiboldItalic16
        button.addTarget(self, action: #selector(forgotPasswordButtonWasClicked), for: .touchUpInside)
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
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailAddressLabel, emailAddressTF,
                                                       passwordLabel, passwordTF])
        stackView.distribution = .equalSpacing
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [loginButton,
                                                      forgotPasswordButton])
        stackView.distribution = .equalSpacing
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var loginStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleStackView,
                                                      formStackView,
                                                      buttonStackView])
        stackView.distribution = .equalSpacing
        stackView.spacing = appearance.stacksSpacing
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        return stackView
    }()
    
    
    let appearance = Appearance()
    let shadow = Shadow()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.makeConstraints()
        self.addSubViews()
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        loginStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(appearance.topOffset + 12)
            make.bottom.equalToSuperview().offset(appearance.bottomOffset)
            make.leading.equalToSuperview().offset(appearance.leadingOffset)
            make.trailing.equalToSuperview().offset(appearance.trailingOffset)
        }
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(loginStackView)
    }
    
    @objc private func loginToYourAccount() {
        presenter?.signIn(email: emailAddressTF.text, password: passwordTF.text)
    }
    
    @objc private func forgotPasswordButtonWasClicked() {
        print("Already have")
    }
}

extension LoginViewController: LoginViewInput {
    
}
