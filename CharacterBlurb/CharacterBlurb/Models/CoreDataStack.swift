//
//  CoreDataStack.swift
//  CharacterBlurb
//
//  Created by Josh Sparks on 11/5/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//
import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaylistCoreData")
        // _ means I don't care
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
