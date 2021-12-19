//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import SwiftUI

//This will display the detail of one of the recipes
struct RecipeDetailView: View {
    
    var recipe:Recipe // we wont set the property to any instance right now. We will rely on the list view to set the particular property
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading){
                //MARK: Recipe Title
//                Text(recipe.name)
//                    .font(.title)
                
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment : .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    
                    ForEach(recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                            .padding(.bottom,0.5)
                    }
                }.padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    ForEach(0..<recipe.directions.count, id:\.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name) // this is added to the scrollview
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it to the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
