//
//  BaseCoordinator.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

open class BaseCoordinator: CoordinatorType {
    
    public var childCoordinators: [CoordinatorType] = []
    open var router: RouterType
    
    public init(router: RouterType) {
        self.router = router
    }
    
    open func start() {
    }
    
    
    public func addDependency(_ coordinator: CoordinatorType) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    public func removeDependency(_ coordinator: CoordinatorType?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    open func toPresent() -> UIViewController {
        let viewController = router.toPresent()
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
}
