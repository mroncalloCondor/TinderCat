//
//  LogInView.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

final class LogInView: UIView {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "TinderCat"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your purrfect match!"
        return label
    }()
    
    private lazy var usernameHintLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()
    
    private lazy var apiKeyHintLabel: UILabel = {
        let label = UILabel()
        label.text = "API Key"
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username"
        return textField
    }
    
    private lazy var apiKeyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "API Key"
        return textField
    }
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.addTarget(self, action: #selector(self.signInPressed(_:)), for: .touchUpInside)
        return button
    }
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(self.registerPressed(_:)), for: .touchUpInside)
        return button
    }
    
    private let parent: LogInViewType
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    init(parent: LogInViewType) {
        self.parent = parent
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        titleLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        usernameHintLabel.anchor(top: subtitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        usernameTextField.anchor(top: subtitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        apiKeyHintLabel.anchor(top: usernameTextField.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        apiKeyTextField.anchor(top: apiKeyHintLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        signInButton.anchor(top: apiKeyTextField.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        registerButton.anchor(top: signInButton.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
    }
    
    @objc func signInPressed(_ sender: UIButton) {
        if !usernameTextField.text?.isEmpty && !apiKeyTextField.text?.isEmpty {
            parent.signInButtonPressed(username: usernameTextField.text!, apiKey: apiKeyTextField.text!)
        }
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        parent.registerButtonPressed()
    }
}
