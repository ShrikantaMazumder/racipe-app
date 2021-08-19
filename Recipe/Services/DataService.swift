//
//  DataService.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 18/8/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // parse local json data
        
        // get url path string
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create url object
        let path = URL(fileURLWithPath: pathString!)
        
        // create data object
        do {
            let data = try Data(contentsOf: path)
            
            // decode the data with json decoder
            let decoder = JSONDecoder()
            
            do {
                let decodedRecipe = try decoder.decode([Recipe].self, from: data)
                // add unique id
                for r in decodedRecipe {
                    r.id = UUID()
                    
                    // add id to ingradients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // return the recipe
                return decodedRecipe
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
