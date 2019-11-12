//
//  CardsListRequest.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Services

public struct CardsListRequest: APIRequest {
    public var method = RequestType.get
    public var path = "/images/search"
    public var parameters: [String : Any]?
    
    public init(page: Int, limit: Int) {
        self.parameters = ["page": page, "limit": limit]
    }
}
