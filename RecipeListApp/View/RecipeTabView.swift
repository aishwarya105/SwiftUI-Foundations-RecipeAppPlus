//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/21/21.
//


/*
 Passing Data Option 1 :
             Recipe Tab View
            /              \
           /                \
          \/                \/
  RecipeFeaturedView        RecipeListView
(Recipe Model instance #2)  (RecipeModel Instance #1)
                                \
                                 \
                                \/
                                RecipeDetailView
 
 Pssing Data Option 2 :
 -- Create a RecipeModel Instance at the top of the heirarchy
 However, as the heirarchy gets deeper you will need to pass the RecipeModel Instance to each view and this is not ideal
 
 Passing Data Option 3 :
 --- RecipeModelInstance as an Environment Object
 --- Saves you from having to write a lot of code
 --- Write the EnvironmentObject Modifier on some parent view
 --- Create the recipe model instance in RecipeTab View
 --- in the sub views add a property for that recipe model and it will automatically be populated
 
 --you can also put the environment object in the entry point of the app i.e. RecipeListApp
 */


import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
        RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
