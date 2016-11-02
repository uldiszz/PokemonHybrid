//
//  ViewController.swift
//  PokedexHybrid
//
//  Created by Uldis Zingis on 02/11/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        PokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            guard let pokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon.name
                self.idLabel.text = "\(pokemon.identifier)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
}

