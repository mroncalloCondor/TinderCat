//
//  LogInContract.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

protocol LogInPresenterType: BasePresenterType {
    func didPressSignIn(username: String, apiKey: String)
    func didPressRegister()
}

protocol LogInViewUIType {
}

protocol LogInViewType {
    func signInButtonPressed(username: String, apiKey: String)
    func registerButtonPressed()
}
