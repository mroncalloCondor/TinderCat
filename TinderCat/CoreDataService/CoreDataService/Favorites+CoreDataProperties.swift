//
//  Favorites+CoreDataProperties.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var height: Int64
    @NSManaged public var id: String?
    @NSManaged public var url: String?
    @NSManaged public var width: Int64

}
