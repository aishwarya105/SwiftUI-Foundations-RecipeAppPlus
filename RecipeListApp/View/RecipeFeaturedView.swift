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
    
    var body: some View {
        //in addition to creating the tab, it can also be used for creating a card view
        VStack(alignment: .leading, spacing:0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            
            GeometryReader { geo in
            TabView {
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
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                        })
                            .sheet(isPresented: $isDetailViewShowing) {
                                //Show the recipe detail view
                                RecipeDetailView(recipe : model.recipes[index])
                            }
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
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }.padding([.leading, .bottom])
        }
    }
    }


struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
