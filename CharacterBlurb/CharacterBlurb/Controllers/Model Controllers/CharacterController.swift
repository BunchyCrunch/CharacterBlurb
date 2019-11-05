//
//  CharacterController.swift
//  CharacterBlurb
//
//  Created by Josh Sparks on 11/5/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import Foundation
import CoreData

class CharacterController {
    
    static var sharedInstance = CharacterController()
    
    var fetchedRequestController: NSFetchedResultsController<Character>
    init() {
        let fetchRequest: NSFetchRequest<Character> = Character.fetchRequest()
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedRequestController = resultsController
        do {
            try fetchedRequestController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func add(characterWithName name: String, bio: String, strength: String, weakness: String, hp: Double) {
        let _ = Character(name: name, bio: bio, strength: strength, weakness: weakness, hp: hp)
        saveToPersistentStore()
    }
    
    func update(character: Character, name: String, bio: String, strength: String, weakness: String, hp: Double) {
        character.name = name
        character.bio = bio
        character.strength = strength
        character.weakness = weakness
        character.hp = hp
        saveToPersistentStore()
    }
    
    func remove(character: Character) {
        CoreDataStack.context.delete(character)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
} // end of class
