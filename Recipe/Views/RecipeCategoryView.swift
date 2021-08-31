//
//  RecipeCategoryView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 31/8/21.
//

import SwiftUI

struct RecipeCategoryView: View {
    @EnvironmentObject var model: RecipeModel
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.top, 40)
            
            GeometryReader { geometry in
                // Category grid view
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), alignment: .top), GridItem(.flexible(), alignment: .top),], alignment: .center, spacing: 20) {
                        // loop through categories
                        ForEach(Array(model.categories), id: \.self) { category in
                            Button(action: {
                                // switch tab to list view
                                selectedTab = Constants.listTab
                                
                                // set the selected category
                                model.selectedCategory = category
                            }, label: {
                                VStack {
                                    Image(category)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geometry.size.width - 20) / 2, height: (geometry.size.width - 20) / 2)
                                        .cornerRadius(10)
                                        .clipped()
                                    
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                                
                            })
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .padding(.horizontal)
    }
}
