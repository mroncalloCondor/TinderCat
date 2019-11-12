//
//  CatCardsRepositoryType.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

public protocol CatCardsRepositoryType: AnyObject {
    func getCatsList(page: Int, limit: Int) -> Single<CatList>
}
