//
//  Drinks.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation

// MARK: - Drinks
struct Drinks: Codable {
    let drinks: [Drink]
}

// MARK: - Drink
struct Drink: Codable {
    let drinkName: String
    let drinkID: String
    let drinkImage: String
    
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case drinkID = "idDrink"
        case drinkImage = "strDrinkThumb"
        
    }
}
