//
//  GetCatsListInteractor.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore
import RxSwift

public struct CatsListParams {
    let page: Int
    let limit: Int
    
    public init(page: Int, limit: Int) {
        self.page = page
        self.limit = limit
    }
}

public final class GetCatsListInteractor: SingleInteractor<CatList, CatsListParams> {
    weak var catsDataRepository: CatCardsRepositoryType?
    public init(catsDataRepository: CatCardsRepositoryType){
        self.catsDataRepository = catsDataRepository
    }
    
    public override func buildUseCase(params: CatsListParams?) -> Single<CatList> {
        return self.catsDataRepository!.getCatsList(page: params!.page, limit: params!.limit)
    }
}
