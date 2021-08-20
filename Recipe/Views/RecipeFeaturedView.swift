//
//  RecipeFeaturedView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 20/8/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isPresented = false
    @State var selectedTabIndex = 0
    
    func setFeaturedIndex() {
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        selectedTabIndex = index ?? 0
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipe")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.leading)
                .padding(.top, 40)
            GeometryReader { geo in
                TabView(selection: $selectedTabIndex) {
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            // Recipe Button
                            Button(action: {
                                self.isPresented = true
                            }, label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Avenir", size: 15))
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isPresented, content: {
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[selectedTabIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                
                RecipeHighlights(highlghts: model.recipes[selectedTabIndex].highlights)
            }
            .padding([.leading, .bottom])
            
                
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
