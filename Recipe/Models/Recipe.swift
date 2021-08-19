//
//  Recipe.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 18/8/21.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id: UUID?
    var name: String = ""
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [Ingradient]
    var directions: [String]
    
}

class Ingradient: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}

