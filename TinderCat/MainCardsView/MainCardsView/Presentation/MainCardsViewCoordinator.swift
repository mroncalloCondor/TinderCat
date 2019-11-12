//
//  MainCardsViewCoordinator.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

protocol MainCardsViewCoordinatorType: AnyObject {
    
}
final public class MainCardsViewCoordinator: BaseCoordinator {
    
    public override func start() {
        let moduleInput = MainCardsViewPresenter.ModuleInput(coordinator: self)
        guard let module = MainCardsViewConfigurator.module(moduleInput: moduleInput) else {
            return
        }
        
        self.router.setRootModule(module)
    }
    
    public override init(router: RouterType) {
        super.init(router: router)
    }
}

extension MainCardsViewCoordinator: MainCardsViewCoordinatorType {}
