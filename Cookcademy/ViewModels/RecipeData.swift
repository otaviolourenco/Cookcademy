//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Otavio Lourenço on 11/11/2024.
//
import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
          if recipe.mainInformation.category == category {
            filteredRecipes.append(recipe)
          }
        }
        return filteredRecipes
      }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
          recipes.append(recipe)
        }
    }
}
