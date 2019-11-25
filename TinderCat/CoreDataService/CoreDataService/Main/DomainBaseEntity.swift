//
//  DomainBaseEntity.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreData

open class DomainBaseEntity: Mappable {
    public var objectID: NSManagedObjectID?
    
    required public init() {
    }
}
