//
//  ContentView.swift
//  Cookcademy
//
//  Created by Otavio Lourenço on 09/11/2024.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    let category: MainInformation.Category
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresenting, content: {
            NavigationStack{
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss"){
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            if newRecipe.isValid {
                                Button("Add"){
                                    recipeData.add(recipe: newRecipe)
                                    isPresenting = false
                                }
                            }
                        }
                    })
                    .navigationTitle("Add a New Recipe")
            }
        })
    }
}

extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}
    
    

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
