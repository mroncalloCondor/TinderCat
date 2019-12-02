//
//  KeychainHelperType.swift
//  CatCore
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol KeychainHelperType {
    static func set(value: Data, account: String) throws
    static func get(account: String) throws -> Data?
    static func delete(account: String) throws
}
