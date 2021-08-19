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
            List(model.recipes) { recipe in
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
                        Text(recipe.name)
                    }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
