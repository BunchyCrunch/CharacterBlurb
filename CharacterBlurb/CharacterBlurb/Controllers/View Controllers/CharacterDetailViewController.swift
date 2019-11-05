//
//  CharacterDetailViewController.swift
//  CharacterBlurb
//
//  Created by Josh Sparks on 11/5/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var hpTF: UITextField!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    @IBOutlet weak var strengthTF: UITextField!
    
    @IBOutlet weak var weaknessTF: UITextField!
    
    var character: Character? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews() {
        guard let character = character else { return }
        loadViewIfNeeded()
        nameTF.text = character.name
        hpTF.text = "\(character.hp)"
        bioTextView.text = character.bio
        strengthTF.text = character.strength
        weaknessTF.text = character.weakness
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTF.text, !name.isEmpty,
            let hp = hpTF.text,
            let bio = bioTextView.text,
            let strength = strengthTF.text,
            let weakness = weaknessTF.text
            else { return }
        
        if character == nil {
            guard let hp = Double(hp) else { return }
            CharacterController.sharedInstance.add(characterWithName: name, bio: bio, strength: strength, weakness: weakness, hp: hp)
        } else {
            guard let character = character,
                let hp = Double(hp) else { return }
            CharacterController.sharedInstance.update(character: character, name: name, bio: bio, strength: strength, weakness: weakness, hp: hp)
        }
        navigationController?.popViewController(animated: true)
    }
    
}


