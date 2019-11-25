//
//  CoreDataStorageContext.swift
//  CoreDataService
//
//  Created by Miguel Roncallo on 11/23/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CoreData

public final class CoreDataStorageContext: StorageContext {

    var managedContext: NSManagedObjectContext?
    
    public init() {
        managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        self.managedContext?.persistentStoreCoordinator = getPersistentStoreCoordinator(managedObject: self.getManagedObjectModel())
    }
    
    private func getManagedObjectModel() -> NSManagedObjectModel {
        let bundle = Bundle(identifier: "test.CoreDataService")!
        guard let modelURL = bundle.url(forResource: "TinderCat", withExtension: "momd") else {
            fatalError("Model not found")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mmomd \(modelURL)")
        }
        return managedObjectModel
    }
    
    private func getPersistentStoreCoordinator(managedObject: NSManagedObjectModel) -> NSPersistentStoreCoordinator {
        let persistentContainer = NSPersistentStoreCoordinator(managedObjectModel: managedObject)
        
        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            fatalError("Store path not found")
        }
            let url = documents.appendingPathComponent("Model.sqlite")
            let options = [ NSMigratePersistentStoresAutomaticallyOption: true,
                            NSInferMappingModelAutomaticallyOption: true ]
            try! persistentContainer.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        return persistentContainer
    }
}
