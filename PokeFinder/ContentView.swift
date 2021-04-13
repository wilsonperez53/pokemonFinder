//
//  ContentView.swift
//  PokeFinder
//
//  Created by Estudiantes on 4/12/21.
//

import SwiftUI



extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            guard let image = UIImage(data: data) else {
                return Image(systemName: "square.fill")
            }
            return Image(uiImage: image)
                .resizable()
        }
        return self
            .resizable()
    }
}



struct ContentView: View {
    
    @ObservedObject var pokeCardsVM = PokemonViewModel()
    @State var search: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
               
                ForEach(self.pokeCardsVM.pokemonCards.prefix(20)){ card in
                    VStack{
                        
                        HStack{
                            Text(String(card.name))
                        }
                        if let cardURL = URL(string: card.images.small) {
                            Image(systemName: "square.fill").data(url: cardURL)
                                .frame(width: 325.0, height: 375.0)
                        }
                    }
                }
                if self.pokeCardsVM.pokemonCards.count == 0
                {
                    
                    HStack{
                        TextField("Pokemon name", text: $search)
                    .padding(7)
                    .background(Color(.systemGray2))
                    .cornerRadius(8)
                        Button(
                        action:{
                            print("Fetching json data")
                            self.pokeCardsVM.fetchCards(name: search)
                        },
                        label:{
                            Text("Search")
                        })
                    }
                }
            }.navigationBarTitle("Pokemon Finder", displayMode: .inline)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
