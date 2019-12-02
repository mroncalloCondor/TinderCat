//
//  LogInPresenter.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

final class LogInPresenter: BasePresenter<LogInViewType>, LogInPresenterType {
    
    struct InputDependencies {
        weak var coordinator: LogInCoordinatorType?
    }
    
    private let dependencies: InputDependencies
    
    init(dependencies: InputDependencies,
         parent: LogInViewType) {
        self.dependencies = dependencies
        super.init()
    }
    
    func didPressSignIn(username: String, apiKey: String) {
        KeychainHelper.set(value: apiKey.data(using: .utf8), account: API_KEY_KEYCHAIN_ACCOUNT)
        UserDefaultsHelper.set(value: true, for: IS_LOGGED_KEY)
        dependencies.coordinator?.nagivateToMainView()
    }
    
    func didPressRegister() {
        dependencies.coordinator?.navigateToRegister()
    }
}
