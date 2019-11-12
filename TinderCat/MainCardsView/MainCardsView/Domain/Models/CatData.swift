//
//  CatData.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public struct CatList{
    public let catList: [Cat]
    
    public init(catList: [Cat]) {
        self.catList = catList
    }
}

public struct Cat {
    let breeds: [Breed]
    let categories: [Category]?
    let height: Int
    let id: String
    let url: String
    let width: Int
    
    public init(breeds: [Breed],
                categories: [Category]?,
                height: Int,
                id: String,
                url: String,
                width: Int) {
        self.breeds = breeds
        self.categories = categories
        self.height = height
        self.id = id
        self.url = url
        self.width = width
        
    }
}

public struct Breed {
    let adaptability, affectionLevel: Int
    let altNames: String
    let cfaURL: String
    let childFriendly: Int
    let countryCode, countryCodes, breedDescription: String
    let dogFriendly, energyLevel, experimental, grooming: Int
    let hairless, healthIssues, hypoallergenic: Int
    let id: String
    let indoor, intelligence: Int
    let lifeSpan, name: String
    let natural: Int
    let origin: String
    let rare, rex, sheddingLevel, shortLegs: Int
    let socialNeeds, strangerFriendly, suppressedTail: Int
    let temperament: String
    let vcahospitalsURL: String
    let vetstreetURL: String
    let vocalisation: Int
    let weight: Weight
    let wikipediaURL: String
    
}

public struct Weight {
    let imperial, metric: String
}

public struct Category {
    let id: Int
    let name: String
}
