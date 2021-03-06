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
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading){

                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                //MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                Text("Select serving size")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 16))
                Picker("", selection : $selectedServingSize){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(.segmented)
                    .frame(width: 200)
                }.padding()
                
                //MARK: Ingredients
                VStack(alignment : .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom,.top], 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize)
                             + " " + item.name.lowercased())
                            .padding(.bottom,0.5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom,.top], 5)
                    ForEach(0..<recipe.directions.count, id:\.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                    
                }
                .padding(.horizontal)
            }
        }
//        .navigationBarTitle(recipe.name) // this is added to the scrollview
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it to the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
           
    }
}
