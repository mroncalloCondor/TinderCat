//
//  Mapper.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Runtime
import CoreData

public final class Mapper {
    
    public class func copy<DomainEntity: Mappable>(from domainEntity: DomainEntity,
                                            target dbEntity: inout DomainEntity) {
        let info = try? typeInfo(of: DomainEntity.self)
        for property in info!.properties {
            try? property.set(value: property.get(from: domainEntity), on: &dbEntity)
        }
    }
    
    public class func mapToDomain<DBEntity: Storable, DomainEntity: Mappable>(from dbEntity: DBEntity, target domainEntity: inout DomainEntity) {
        
        let domainEntityInfo = try? typeInfo(of: DomainEntity.self)
        let managedObject: NSManagedObject? = dbEntity as? NSManagedObject
        let keys = managedObject?.entity.attributesByName.keys
        
        for dbEntityKey in keys! {
            let value = managedObject?.value(forKey: dbEntityKey)
            do {
                let domainProperty = try domainEntityInfo?.property(named: dbEntityKey)
                try domainProperty?.set(value: value as Any, on: &domainEntity)
            } catch {
                print(error.localizedDescription)
            }
        }
        domainEntity.objectID = managedObject?.objectID
    }
    
    public class func mapToDB<DomainEntity: Mappable, DBEntity: Storable>(from domainEntity: DomainEntity, target dbEntity: DBEntity) {
        
        let managedObject: NSManagedObject? = dbEntity as? NSManagedObject
        let keys = managedObject?.entity.attributesByName.keys
        
        let domainEntityMirror = Mirror(reflecting: domainEntity)
        for dbEntityKey in keys! {
            for property in domainEntityMirror.children.enumerated() where
                
                property.element.label == dbEntityKey {
                    let value = property.element.value as AnyObject
                    if !value.isKind(of: NSNull.self) {
                        managedObject?.setValue(value, forKey: dbEntityKey)
                    }
            }
        }
    }
}

