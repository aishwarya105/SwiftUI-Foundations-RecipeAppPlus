//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/27/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    //this property will automatically be populated from the environment object that you created in the RecipeTabView simply because this view is in the heirarchy of the parent tab view
    
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    
    /// <#Description#>
    var body: some View {
        //in addition to creating the tab, it can also be used for creating a card view
        VStack(alignment: .leading, spacing:0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
                
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    //Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                    
                        //only show those that are fetured
                        if model.recipes[index].featured {
                        
                        //recipe card
                        //specify corner radius before the shadow so that you dont clip your shadow
                        Button(action: {
                            //when the button is tapped flip the view to true
                            self.isDetailViewShowing = true
                        } , label : {
                            RecipeCardView(recipe:model.recipes[index])
                        })
                            .tag(index) //the index for the card will be written to the tabSelectionIndex
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                //Show the recipe detail view
                                RecipeDetailView(recipe : model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                            
                        }
                    }
                }

            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) //this will help display the dots on a white background
        
            
            VStack(alignment: .leading, spacing:10) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size: 15))
            }.padding([.leading, .bottom])
        }
        .onAppear(perform: {
                //gets called when RecipeFeaturedView gets created
                setFeaturedIndex()
            })
    }
    
    func setFeaturedIndex() {
        
        //Find the index of the first recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
    }




struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
