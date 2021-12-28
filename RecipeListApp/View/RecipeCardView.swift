//
//  RecipeCardView.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/28/21.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe:Recipe // we wont set the property to any instance right now. We will rely on the featured view to set the particular property
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack(spacing: 0) {
                Image(recipe.image)
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                Text(recipe.name)
                    .padding(5)
                    .font(Font.custom("Avenir Heavy", size: 24))
            }
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        RecipeCardView(recipe: model.recipes[0])
    }
}
