//
//  DrinkResponse.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation

import Foundation

// TODO: change naming convention

struct DrinksDetails: Codable {
    let drinks: [DrinkDetail]
}

struct DrinkDetail: Codable {
    
    let drinkName: String
    let imageString: String
    let drinkID: String
    
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    
    let instructions: String
    
    lazy var ingredients: [String] = {
        var array: [String] = []
        ingredient1.map { array.append($0) }
        ingredient2.map { array.append($0) }
        ingredient3.map { array.append($0) }
        ingredient4.map { array.append($0) }
        ingredient5.map { array.append($0) }
        ingredient6.map { array.append($0) }
        ingredient7.map { array.append($0) }
        ingredient8.map { array.append($0) }
        ingredient9.map { array.append($0) }
        ingredient10.map { array.append($0) }
        
        return array
    }()
    
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case imageString = "strDrinkThumb"
        case drinkID = "idDrink"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        
        case instructions = "strInstructions"
    }
}
