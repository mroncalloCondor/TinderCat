//
//  UserDefaultsHelper.swift
//  CatCore
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public final class UserDefaultsHelper: UserDefaultsHelperType {
    public static func set(value: Any, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    public static func get<T>(for key: String, of type: T.Type) -> T? {
        return UserDefaults.value(forKey: key) as? T
    }
    
    
}
