//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Aishwarya Agarwal on 12/17/21.
//

import Foundation

//This should mirror the JSON object
class Recipe :Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
}
