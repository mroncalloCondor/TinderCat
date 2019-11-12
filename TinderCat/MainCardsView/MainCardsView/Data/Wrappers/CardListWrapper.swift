//
//  CardListWrapper.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

final class CardListWrapper {
    static func map(_ apiCatList: [APICat]) -> CatList {
        let cats = apiCatList
        var catList = [Cat]()
        
        for cat in cats {
            let catData = Cat(breeds: [], categories: [], height: cat.height, id: cat.id, url: cat.url, width: cat.width)
            catList.append(catData)
        }
        
        return CatList(catList: catList)
    }
}
