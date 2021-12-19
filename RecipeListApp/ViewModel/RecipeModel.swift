//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import Foundation

class RecipeModel : ObservableObject {
    
    @Published var recipes = [Recipe]() //array of JSON object
    
    
    init() {
        // Create an instance of data service and get the data
        let service = DataService()
        self.recipes = service.getLocalData()
        
        //Set the recipes properly
    }
    
}
