//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Aldo Márquez Aguilar on 01/04/22.
//

import Foundation

struct PokemonSelected: Codable {
    var base_experience: Int
    var sprites: PokemonSprites
    var height: Int
    var weight: Int
    var name: String
}

struct PokemonSprites: Codable {
    var front_default: String
}

class PokemonSelectedApi{
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()){
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else { return }
            let pokemonSprites = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            let pokemonName = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            let pokemonHeight = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            let pokemonWeight = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonSprites.sprites)
//                completion(pokemonName.name)
//                completion(pokemonHeight.height)
//                completion(pokemonWeight.weight)
            }
        }.resume()
    }
}
