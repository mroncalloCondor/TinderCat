//
//  CoordinatorType.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol CoordinatorType: AnyObject, Presentable {
    var childCoordinators: [CoordinatorType] { get set }
    var router: RouterType { get }
    func start()
}
