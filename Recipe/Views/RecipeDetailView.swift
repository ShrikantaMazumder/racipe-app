//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 19/8/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedSize = 2
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: image view
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                    .padding(.top)
                    .padding(.leading)
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                        .font(.caption)
                    Picker("", selection: $selectedSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .frame(width: 160)
                .padding()
                
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(recipe.ingredients) { ingrad in
                        Text("• " + RecipeModel.getPortion(ingradient: ingrad, recipeServing: recipe.servings, targetServings: selectedSize) + " " + ingrad.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text("\(index+1). \(recipe.directions[index])")
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
                
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
