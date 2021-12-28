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
    
    //static means that we can call this method without creating an instance of the RecipeModel
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) ->String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1 //coalesce operator
        var denominator = ingredient.denom ?? 1 // coalesce operator
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //Reduce fraction by the greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if num greater than denom
            if numerator >= denominator {
                //calculate whole portions
                wholePortions = numerator/denominator
                
                //calcualte remainder
                numerator = numerator % denominator
                
                //assign to portion string
                portion += String(wholePortions)
                
            }
            
            //Express remainder as fraction
            if numerator > 0 {
                //assign remainder as frction to the portion string
                portion += wholePortions > 0 ? " " : "" // if statement inline
                portion += "\(numerator)/\(denominator)"
                
            }
            
        }
        if var unit = ingredient.unit {
             
            
            //check if we need to pluralize
            if wholePortions > 1 {
                //calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                    
                }else if (unit.suffix(1) == "f") {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                
            }
            
            
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        
        return portion
        
    }
    
}
