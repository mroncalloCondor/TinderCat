//
//  User+CoreDataProperties.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var apiKey: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?

}
