//
//  LogInConfigurator.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Catcore

public final class LogInConfigurator {
    class func configure(moduleInput: LogInPresenter.ModuleInput) -> UIViewController {
        let dependencies = self.createDependencies(coordinator: moduleInput.coordinator)
        let presenter = LogInPresenter(dependencies: dependencies)
        let logInViewController = LogInViewController(presenter: presenter)
        return logInViewController
    }
    
    private class func createDependencies(coordinator: LogInCoordinatorType) -> LogInPresenter.InputDependencies {
        return LogInPresenter.InputDependencies(coordinator: coordinator)
    }
    
    static func module(moduleInput: LogInPresenter.ModuleInput) -> UIViewController? {
        let output = LogInConfigurator.configure(moduleInput: moduleInput)
        return output
    }
}
