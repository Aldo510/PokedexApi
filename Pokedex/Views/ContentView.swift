//
//  ContentView.swift
//  Pokedex
//
//  Created by Aldo Márquez Aguilar on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView{
        
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })){ entry in
                    HStack(){
//                        print("\(entry)")
                        PokemonImage(imageLink: "\(entry.url)") // Pokemon Image
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized, destination: PokemonSelectedView(name: entry.name, imageLink: entry.url))
//                        "\(entry.name)".capitalized, destination: Text("Detail view for \(entry.url)")
                            
                    }
                }
            }
            .onAppear(){
                PokeApi().getData(){ pokemon in
                    self.pokemon = pokemon
                    
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex UI")
        }
    }
}

