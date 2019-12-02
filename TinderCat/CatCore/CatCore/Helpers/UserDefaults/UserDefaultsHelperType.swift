//
//  UserDefaultsHelperType.swift
//  CatCore
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol UserDefaultsHelperType {
    static func set(value: Any, for key: String)
    static func get<T>(for key: String, of type: T.Type) -> T?
}
