//
//  DataService.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] { //[Recipe] is an array of JSON objects, similar to what we see in the JSON file 
        
        // Parse local json file and return it
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if path is not nill otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Get a url path to the json file
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients
                    for ing in r.ingredients {
                        ing.id = UUID()
                    }
                }
                //Return the recipe
                return recipeData
                
            } catch {
                print(error)
            }

            
        } catch {
            print(error)
        }
        
        return [Recipe]()
        
        
        
    }
    
}
