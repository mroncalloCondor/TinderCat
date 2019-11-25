//
//  StorageContext.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/23/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreData

public protocol StorageContext {
    
    func create<DBEntity: Storable>(_ model: DBEntity.Type) -> DBEntity?
    
    func save<DBEntity: Storable>(object: Storable, _ type: DBEntity.Type ) throws
    
    func update(object: Storable) throws
    
    func delete(object: Storable) throws
    
    func fetch(_ model: Storable.Type, predicate: NSPredicate?, sorted: Sorted?) -> [Storable]
}

extension StorageContext {
    public func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity? {
        return nil
    }
}
