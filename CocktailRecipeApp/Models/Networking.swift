//
//  Networking.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation

enum NetworkError: Error {
    case otherError(Error)
    case noData
    case decodeFailed
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case pull = "PULL"
    case delete = "DELETE"
}

enum Endpoints {
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    case searchByIngredient(String)
    case lookUp(String)
    
    var stringValue: String {
        switch self {
        case .searchByIngredient(let searchTerm):
            return Endpoints.baseURL + "filter.php?i=\(searchTerm)"
        case .lookUp(let id):
            return Endpoints.baseURL + "lookup.php?i=\(id)"
        }
    }
    var url: URL {
        
        return URL(string: stringValue)!
    }
}

//TODO: Divide it for two seperated classes and/or create protocols with func search and lookUp
class ApiService {
    
    var drinks: Drinks?
    var drinksResponse: DrinksResponse?
    
    func searchCocktailByIngredient(searchTerm: String, completion: @escaping (Result<Drinks, NetworkError>) -> Void) {
        var request = URLRequest(url: Endpoints.searchByIngredient(searchTerm).url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.otherError(error!)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                self.drinks = try decoder.decode(Drinks.self, from: data)
                completion(.success(self.drinks!))
            } catch {
                // returns empty body on unsuccessful query
                completion(.failure(.decodeFailed))
                return
            }
        }.resume()
    }
    
    func lookupFullCocktailDetails(id: String, completion: @escaping (Result<DrinksResponse, NetworkError>) -> Void) {
        var request = URLRequest(url: Endpoints.lookUp(id).url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.otherError(error!)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                self.drinksResponse = try decoder.decode(DrinksResponse.self, from: data)
                completion(.success(self.drinksResponse!))
            } catch  {
                completion(.failure(.decodeFailed))
                return
            }
        }.resume()
    }
}
