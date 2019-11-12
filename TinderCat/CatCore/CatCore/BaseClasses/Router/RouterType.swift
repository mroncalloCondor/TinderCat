//
//  RouterType.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol RouterType: AnyObject, Presentable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    
    func push(_ module: Presentable)
    
    func popModule()
    
    func dismissModule()
    
    func setRootModule(_ module: Presentable)
}
