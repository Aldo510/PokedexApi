//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Aldo Márquez Aguilar on 01/04/22.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var PokemonSprite = ""
    var body: some View {
        AsyncImage(url: URL(string: PokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear(){
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                if loadedData == nil{
                    getSprites(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
//                    print("New url!! Caching...")
                }else{
                    getSprites(url: loadedData!)
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
    }
    
    func getSprites(url: String){
        var tempSprite: String?
        PokemonSelectedApi().getData(url: url){
            sprite in
            tempSprite = sprite.front_default
            self.PokemonSprite = tempSprite ?? "Placeholder"
        }
    }
}
