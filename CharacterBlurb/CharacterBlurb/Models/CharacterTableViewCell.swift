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
    
    weak var delegate: characterTableViewCellDelegate?
}

extension CharacterTableViewCell {
    func update(withCharacter character: Character) {
        nameLabel.text = character.name
    }
}

protocol characterTableViewCellDelegate: class {
}
