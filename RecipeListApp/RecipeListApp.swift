//
//  RecipeListAppApp.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import SwiftUI

@main
struct RecipeListApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
            //because featured views and list views are sub views they are still going to be accessible
        }
    }
}
