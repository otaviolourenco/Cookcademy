//
//  ContentView.swift
//  Cookcademy
//
//  Created by Otavio Lourenço on 09/11/2024.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView{
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
        }
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView()
        }
    }
}
