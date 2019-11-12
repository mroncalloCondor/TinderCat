//
//  MainRouter.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

final public class MainRouter: NSObject, RouterType {
    
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    public var hasRootController: Bool {
        return rootViewController != nil
    }
    
    public let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        super.init()
    }
    
    public func push(_ module: Presentable) {
        self.navigationController.pushViewController(
            module.toPresent(),
            animated: true)
    }
    
    public func popModule() {
        self.navigationController.popViewController(animated: true)
    }
    
    
    public func dismissModule() {
        self.navigationController.dismiss(animated: true,
                                          completion: nil)
    }
    
    public func setRootModule(_ module: Presentable) {
        self.navigationController.setViewControllers([module.toPresent()], animated: false)
    }
    
    public func toPresent() -> UIViewController {
        return self.navigationController
    }
}
