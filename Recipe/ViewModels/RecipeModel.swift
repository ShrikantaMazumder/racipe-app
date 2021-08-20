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
    
    static func getPortion(ingradient: Ingradient, recipeServing: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingradient.num ?? 1
        var denominator = ingradient.denom ?? 1
        var wholePortions = 0
        
        if ingradient.num != nil {
            denominator *= recipeServing
            numerator *= targetServings
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                // calculate whole portion
                wholePortions = numerator / denominator
                
                // Calculate remainder
                numerator = numerator % denominator
                // add to portion
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        if var unit = ingradient.unit {
            
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                    } else {
                        unit += "s"
                    }
            }
            portion += ingradient.num == nil && ingradient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
