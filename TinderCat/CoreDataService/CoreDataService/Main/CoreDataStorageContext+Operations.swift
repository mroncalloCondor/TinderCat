//
//  CoreDataStorageContext+Operations.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataStorageContext {
    
    public func create<DBEntity: Storable>(_ model: DBEntity.Type) -> DBEntity? {
        let entityDescription =  NSEntityDescription.entity(forEntityName: String.init(describing: model.self),
                                                            in: managedContext!)
        
        let entity = NSManagedObject(entity: entityDescription!,
                                     insertInto: managedContext)
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("\(paths[0])")
        return entity as? DBEntity
    }
    public func save<DBEntity: Storable>(object: Storable, _ type: DBEntity.Type) throws {
    
        try! managedContext?.save()
    }
    
    public func update(object: Storable) throws {
        
    }
    
    public func delete(object: Storable) throws {
        
    }
    
    public func fetch(_ model: Storable.Type, predicate: NSPredicate?, sorted: Sorted?) -> [Storable] {
        let entityName = String.init(describing: model.self)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let result = try! managedContext?.fetch(fetchRequest) as! [Storable]
        return result
    }
    
    public func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity? {
        do {
            let result = try managedContext!.existingObject(with: objectId)
            return result as? DBEntity
        } catch {
            print("Failure")
        }
        
        return nil
    }
}
