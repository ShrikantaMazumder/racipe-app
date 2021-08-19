//
//  RecipeModel.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 18/8/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        
        // load local data by data service
        self.recipes = DataService.getLocalData()
        
    }
}
