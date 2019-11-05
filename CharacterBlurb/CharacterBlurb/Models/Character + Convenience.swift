//
//  Character.swift
//  CharacterBlurb
//
//  Created by Josh Sparks on 11/5/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import Foundation
import CoreData

extension Character {
    convenience init(name: String, bio: String, strength: String, weakness: String, hp: Double, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        self.bio = bio
        self.strength = strength
        self.weakness = weakness
        self.hp = hp
    }
}
