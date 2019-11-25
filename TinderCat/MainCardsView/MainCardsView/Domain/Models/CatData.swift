//
//  CatData.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreDataService
import CoreData

public class CatList{
    public let catList: [Cat]
    
    public init(catList: [Cat]) {
        self.catList = catList
    }
}

public class Cat: DomainBaseEntity {

    let height: Int
    let id: String
    let url: String
    let width: Int
    
    public init(height: Int,
                id: String,
                url: String,
                width: Int) {
        self.height = height
        self.id = id
        self.url = url
        self.width = width
        
    }
    
    required init() {
        self.height = 0
        self.id = ""
        self.url = ""
        self.width = 0
        super.init()
    }
}
