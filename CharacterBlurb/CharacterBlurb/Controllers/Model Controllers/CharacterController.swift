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
    
    var characters: [Character] {
        
        let fetchedRequestController: NSFetchRequest<Character> = Character.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchedRequestController)) ?? []
        
    }
//    var fetchedRequestController: NSFetchedResultsController<Character>
//    init() {
//        let fetchRequest: NSFetchRequest<Character> = Character.fetchRequest()
//        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
//
//        fetchedRequestController = resultsController
//        do {
//            try fetchedRequestController.performFetch()
//        } catch {
//            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//        }
//    }
    
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
    
    func mockData() {
        add(characterWithName: "The Godfather", bio: "Mafia hitman who uses a spaghetti whip to eliminate his foes", strength: "Stealth", weakness: "Lost in the sauce", hp: 100)
        add(characterWithName: "Kourtney", bio: "Swedish Viking Warrior", strength: "Karate Chops", weakness: "Puppies", hp: 100)
        add(characterWithName: "Kasiopia", bio: "I'm a star warrior from Constalationa", strength: "Star Power", weakness: "Spontaneous combustion", hp: 100)
        add(characterWithName: "Zartora", bio: "Pirate Elf dual wielding pistols", strength: "Agile", weakness: "Reckless", hp: 100)
        add(characterWithName: "Josh", bio: "bio", strength: "strength", weakness: "weakness", hp: 100)
        add(characterWithName: "Mike", bio: "bio", strength: "strength", weakness: "weakness", hp: 100)
        add(characterWithName: "Sindabad", bio: "man who has magic ring", strength: "Selfless", weakness: "Chocolate", hp: 100)
        add(characterWithName: "Marcus", bio: "bio", strength: "swift", weakness: "CoreData", hp: 100)
        
    }
} // end of class
