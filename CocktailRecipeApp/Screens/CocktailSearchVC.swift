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
    private let cellID = "cellID"
    
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
        customCollectionViewLayout()
        //      fetchDrinks(searchTerm: searchBar.text ?? "")
    }
    
    func customCollectionViewLayout() {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 2
        layout?.minimumInteritemSpacing = 2
        layout?.sectionInset = .init(top: 2, left: 2, bottom: 2, right: 2)
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
        
        let sidePadding: CGFloat = 10
        let numbersOfItemInRow: CGFloat = 2.0
        let width = (view.frame.width - sidePadding)/numbersOfItemInRow
        
        return CGSize(width: width, height: width)
    }
}

extension CocktailSearchVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CocktailCellVC
        cell.backgroundColor = .white
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

