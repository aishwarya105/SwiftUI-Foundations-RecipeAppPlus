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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
