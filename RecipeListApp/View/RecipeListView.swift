//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reference the view model
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment:.leading){
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe:r),
                                           label: {
                                HStack {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                            })
                        }
                    }
                }
                
            }.padding()
            //.navigationBarTitle("All Recipes") //lets remove this to have more control on the title
            .navigationBarHidden(true) // this will give us the space back
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
