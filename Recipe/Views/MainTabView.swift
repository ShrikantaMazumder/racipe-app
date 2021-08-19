//
//  MainTabView.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 19/8/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Featured Tab")
                .tabItem {
                    Image(systemName: "star")
                    Text("Featured")
                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Recipes")
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
