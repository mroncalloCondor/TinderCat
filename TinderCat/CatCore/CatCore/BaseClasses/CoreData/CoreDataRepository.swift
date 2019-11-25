//
//  CoreDataRepository.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/24/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreDataService

public final class CoreDataRepository<DomainEntity: Mappable, DBEntity: Storable> {
    
    private var storageContext: StorageContext?
    
    required public init(storageContext: StorageContext) {
        self.storageContext = storageContext
    }
    
    public func create() -> Mappable? {
        let dbEntity: DBEntity? = storageContext?.create(DBEntity.self)
        return mapToDomain(dbEntity: dbEntity!)
    }
    
    public func save<DomainEntity: Mappable>(object: DomainEntity) throws {
        var dbEntity: DBEntity?
        if object.objectID != nil {
            dbEntity = storageContext?.objectWithObjectId(objectId: object.objectID!)
        } else {
            
            dbEntity = storageContext?.create(DBEntity.self)
        }
        
        Mapper.mapToDB(from: object, target: dbEntity!)
        
        try storageContext?.save(object: dbEntity!, DBEntity.self)
    }
    
    public func update<DomainEntity: Mappable>(object: DomainEntity) throws {
        if object.objectID != nil {
            let dbEntity: DBEntity? = storageContext?.objectWithObjectId(objectId: object.objectID!)
            Mapper.mapToDB(from: object, target: dbEntity!)
            try storageContext?.update(object: dbEntity!)
        }
    }
    
    public func delete<DomainEntity: Mappable>(object: DomainEntity) throws {
        if object.objectID != nil {
            let dbEntity: DBEntity? = storageContext?.objectWithObjectId(objectId: object.objectID!)
            try storageContext?.delete(object: dbEntity!)
        }
    }
    
    public func fetch(predicate: NSPredicate?, sorted: Sorted? = nil) -> [DomainEntity] {
        let dbEntities = storageContext?.fetch(DBEntity.self, predicate: predicate, sorted: sorted) as? [DBEntity]
        return mapToDomain(dbEntities: dbEntities)
    }
    
    private func mapToDomain<DBEntity: Storable>(dbEntity: DBEntity) -> DomainEntity {
        var domainEntity = DomainEntity.init()
        Mapper.mapToDomain(from: dbEntity, target: &domainEntity)
        return domainEntity
    }
    
    private func mapToDomain<DBEntity: Storable>(dbEntities: [DBEntity]?) -> [DomainEntity] {
        var domainEntities = [DomainEntity]()
        for dbEntity in dbEntities! {
            domainEntities.append(mapToDomain(dbEntity: dbEntity))
        }
        return domainEntities
    }
}
