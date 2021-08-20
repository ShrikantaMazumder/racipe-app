//
//  RecipeHighlights.swift
//  Recipe
//
//  Created by Shrikanta Mazumder on 21/8/21.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    init(highlghts: [String]) {
        for index in 0..<highlghts.count {
            if highlghts.count - 1 == index {
                allHighlights += highlghts[index]
            } else {
                allHighlights += highlghts[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlghts: ["hello", "hello 2", "hello 3"])
    }
}
