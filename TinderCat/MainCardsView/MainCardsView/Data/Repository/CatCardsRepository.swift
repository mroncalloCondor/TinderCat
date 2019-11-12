//
//  CatCardsRepository.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Services
import RxSwift

public final class CatCardsRepository: CatCardsRepositoryType {
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func getCatsList(page: Int, limit: Int) -> Single<CatList> {
        let request = CardsListRequest(page: page, limit: limit)
        
        return apiClient.performOperation(request: request).map({ (data: [APICat])  in
            return CardListWrapper.map(data)
        })
    }
}
