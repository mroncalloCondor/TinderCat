//
//  APIRequest.swift
//  Services
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol APIRequest {
    var method: RequestType {get}
    var path: String {get}
    var parameters: [String: Any]? {get}
}

public enum RequestType: String{
    case get
    case post
}
