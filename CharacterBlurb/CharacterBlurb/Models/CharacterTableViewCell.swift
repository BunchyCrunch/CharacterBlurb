//
//  CharacterTableViewCell.swift
//  CharacterBlurb
//
//  Created by Josh Sparks on 11/5/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
}

extension CharacterTableViewCell {
    func update(withCharacter character: Character) {
        nameLabel.text = character.name
        strengthLabel.text = character.strength
        hpLabel.text = "\(character.hp)"
    }
}
