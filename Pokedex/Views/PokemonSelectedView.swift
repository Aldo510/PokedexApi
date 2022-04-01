//
//  PokemonSelectedView.swift
//  Pokedex
//
//  Created by Aldo Márquez Aguilar on 01/04/22.
//

import SwiftUI

struct PokemonSelectedView: View {
    var name = ""
    var imageLink = ""
    @State private var PokemonSprite = ""
    var body: some View {
        VStack{
            Text("Detalles del pokemon")
                .font(.caption)
                .foregroundColor(.gray)
            AsyncImage(url: URL(string: PokemonSprite))
                .frame(width: 150, height: 150)
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
            Text(name.capitalized)
                .bold()
                .font(.title)
        }
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
