//
//  Mappable.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreData

public protocol Mappable {
    var objectID: NSManagedObjectID? { get set }
    init()
}
