//
//  MainTabView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 19/8/21.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = Constants.featureTab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Featured
            RecipeFeaturedView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Featured")
                }
                .tag(Constants.featureTab)
            
            // category
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
                .tag(Constants.categoryTab)
            
            // Recipe list
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Recipes")
                }
                .tag(Constants.listTab)
        }
        .environmentObject(RecipeModel())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
