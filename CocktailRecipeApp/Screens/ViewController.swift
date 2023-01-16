//
//  ViewController.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit
import Kingfisher

class CocktailSearchVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var apiService = ApiService()
    
    var drink: [Drink]!
    var drinksResult: DrinkDetail?
    private let cellID = "cellID"
    
//    var drinksResults: [DrinkResult] = [] {
//        didSet {
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }

    var drinks: [Drink] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        fetchDrinks(searchTerm: "Vodka")
//        whichButtonWasPushed(searchTerm: searchBar.text ?? "")
           drink = drinks
    }
    
}

extension CocktailSearchVC {
    
    private func titleConfiguration() {
        self.navigationController?.navigationBar.topItem?.title = "Cocktail App"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Gill Sans", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension CocktailSearchVC {
    
    private func viewConfiguration() {
        titleConfiguration()
        setupCollectionView()
        // configureSearchBarUI()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemPink
        collectionView.register(CocktailCellVC.self, forCellWithReuseIdentifier: cellID)
    }
}

extension CocktailSearchVC {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           let leftAndRightPadding: CGFloat = 12.0
           let numberOfItemsInRow: CGFloat = 2.0
           let width = (view.frame.width-leftAndRightPadding)/numberOfItemsInRow

           return CGSize(width: width, height: view.frame.height/4)
       }
}

extension CocktailSearchVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CocktailCellVC
        cell.backgroundColor = .systemPink
        //TODO: SetUp views for the cell like image and drink labels
        let drink = drinks[indexPath.row].drinkName
        let image = drinks[indexPath.row].drinkImage
        let url = URL(string: image)
        
            cell.setRecipeTitleLabel(title: drink)
            cell.recipeImageView.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let drinkID = drinks[indexPath.row].drinkID
        let vc = CocktailRecipeVC(id: drinkID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CocktailSearchVC {
    
    func fetchDrinks(searchTerm: String) {
        
        apiService.searchCocktailByIngredient(searchTerm: searchTerm) { result in
            do {
                let drinks = try result.get()
                DispatchQueue.main.async {
                    self.drinks = drinks.drinks
                }
            } catch {
                print(result)
            }
        }
    }
}


extension CocktailSearchVC {
    
    
}
