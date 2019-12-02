//
//  LogInCoordinator.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore
import MainCardsView
import SafariServices

protocol LogInCoordinatorType: AnyObject {
    func nagivateToMainView()
    func navigateToRegister()
}

final public class LogInCoordinator: BaseCoordinator {
    public override func start() {
        let moduleInput = LogInPresenter.ModuleInput(coordinator: self)
        guard let module = LogInConfigurator.module(moduleInput: moduleInput) else {
            return
        }
        self.router.setRootModule(module)
    }
    
    public override init(router: RouterType) {
        super.init(router: router)
    }
}

extension LogInCoordinator: LogInCoordinatorType {
    
    func nagivateToMainView() {
        let coordinator = MainCardsViewCoordinator(router: self.router)
        coordinator.start()
    }
    
    func navigateToRegister() {
        let url = URL(string: "https://thecatapi.com/signup")
        let safariVC = SFSafariViewController(url: url!)
        self.router.push(safariVC)
    }
}
