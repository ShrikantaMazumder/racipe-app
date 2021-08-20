//
//  ContentView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 18/8/21.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.top, 40)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
                           NavigationLink(
                            destination: RecipeDetailView(recipe: recipe),
                            label: {
                                HStack(spacing: 20.0){
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10.0)
                                        .clipped()
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlghts: recipe.highlights)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                        
                    }
                }
            }
            .padding(.leading)
            .navigationBarHidden(true)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
