//
//  APICatData.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

// MARK: - Cat
struct APICat: Codable {
    public let height: Int
    public let id: String
    public let url: String
    public let width: Int
}

// MARK: - Breed
struct APIBreed: Codable {
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
    let weight: APIWeight
    let wikipediaURL: String
    
    enum CodingKeys: String, CodingKey {
        case adaptability
        case affectionLevel = "affection_level"
        case altNames = "alt_names"
        case cfaURL = "cfa_url"
        case childFriendly = "child_friendly"
        case countryCode = "country_code"
        case countryCodes = "country_codes"
        case breedDescription = "description"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case experimental, grooming, hairless
        case healthIssues = "health_issues"
        case hypoallergenic, id, indoor, intelligence
        case lifeSpan = "life_span"
        case name, natural, origin, rare, rex
        case sheddingLevel = "shedding_level"
        case shortLegs = "short_legs"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case suppressedTail = "suppressed_tail"
        case temperament
        case vcahospitalsURL = "vcahospitals_url"
        case vetstreetURL = "vetstreet_url"
        case vocalisation, weight
        case wikipediaURL = "wikipedia_url"
    }
}

// MARK: - Weight
struct APIWeight: Codable {
    let imperial, metric: String
}

// MARK: - Category
struct APICategory: Codable {
    let id: Int
    let name: String
}
