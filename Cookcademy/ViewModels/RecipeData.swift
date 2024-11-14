//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Otavio Lourenço on 11/11/2024.
//
import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
