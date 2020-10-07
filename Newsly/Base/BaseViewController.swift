//
//  BaseViewController.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private lazy var indicatorBlurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: effect)
        view.alpha = 0.5
        view.isHidden = true
        return view
    }()
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
    }
    
    func setUpUI() {
        self.view.backgroundColor = .background
        
        //TODO: -  fix me
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.mediumItalic32,
            NSAttributedString.Key.foregroundColor: UIColor.textColor
        ]
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.addSubViews()
        self.makeConstraints()
    }
    
    
    func addSubViews() {
        self.view.addSubview(indicatorBlurView)
        self.indicatorBlurView.contentView.addSubview(indicator)
    }
    
    func makeConstraints() {
        
        indicatorBlurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    // MARK: Functions
    func showActivityIndicator() {
        self.indicatorBlurView.isHidden = false
        self.view.bringSubviewToFront(self.indicatorBlurView)
        self.indicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.indicatorBlurView.isHidden = true
        self.indicator.stopAnimating()
    }



}
