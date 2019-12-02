//
//  LogInViewController.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

final class LogInViewController:
    BaseViewController<LogInPresenterType>,
    LogInViewType {
    
    private var logInUIView: LogInViewUIType {
        return self.view as! LogInViewUIType
    }
 
    override func viewDidLoad() {
        self.presenter.bind(view: self)
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.view = LogInView(parent: self)
    }
    
    func signInButtonPressed(username: String, apiKey: String) {
        print("Sign in button pressed")
        presenter.didPressSignIn(username: username, apiKey: apiKey)
    }
    
    func registerButtonPressed() {
        print("Register button pressed")
        presenter.didPressRegister()
    }
}
