//
//  CocktailRecipeVC.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation
import UIKit

final class CocktailRecipeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let id: String
    
    let apiService = ApiService()
    private let sectionId = "sectionId"
    private let stepsId = "stepsId"
    private let ingredientId = "ingredientId"
    private let stepsCell = "stepsCell"
    private let ingCell = "ingCell"
    private let padding: CGFloat = 10
    
    var drinkDetails: DrinkDetail? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init(id: String) {
        self.id = id
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemPink
        registerCollectionView()
        registerCells()
        downloadDetailsForDrink(with: id)
        customCollectionViewLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func registerCells() {
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.register(IngredientsCell.self, forCellWithReuseIdentifier: ingCell)
        collectionView.register(StepsCell.self, forCellWithReuseIdentifier: stepsCell)
        collectionView.register(PhotoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: sectionId)
        collectionView.register(IngredientsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: ingredientId)
        collectionView.register(StepsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: stepsId)
    }
    
    func customCollectionViewLayout() {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout?.minimumLineSpacing = 2
        layout?.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    
    private func downloadDetailsForDrink(with id: String) {
        
        apiService.lookupFullCocktailDetails(id: id) { result in
            do {
                let details = try result.get()
                DispatchQueue.main.async {
                    self.drinkDetails = details.drinks.first
                    
                }
            } catch {
                print(result)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return drinkDetails?.ingredients.count ?? 0
        } else if section == 2 {
            return 1
        } else {
            return 0
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO: Delete unnessesary sections
        if indexPath.section == 0 {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ingCell, for: indexPath) as? IngredientsCell else { return UICollectionViewCell() }
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ingCell , for: indexPath) as? IngredientsCell else { return UICollectionViewCell() }
            cell.setIngredientLabel(text: "ingredient".uppercased())
            let ingredient = drinkDetails?.ingredients[indexPath.row]
            cell.setIngredientLabel(text: ingredient ?? "")
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: stepsCell , for: indexPath) as? StepsCell else { return UICollectionViewCell() }
            
            let recipeText = drinkDetails?.instructions
            cell.setRecipeText(text: recipeText?.uppercased() ?? "")
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return .init(width: view.frame.width - 2*padding, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let kind = UICollectionView.elementKindSectionHeader
        if indexPath.section == 0 {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionId, for: indexPath) as? PhotoHeader {
                let drinkImage = drinkDetails?.imageString
                let url = URL(string: drinkImage ?? "")
                header.recipePhoto.kf.setImage(with: url)
                let drinkName = drinkDetails?.drinkName
                let imageTitleLabel = drinkName
                header.setImageTitleLabel(title: imageTitleLabel ?? "")
                header.backgroundColor = .systemPink
                return header
            }
            
        } else if indexPath.section == 1 {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ingredientId, for: indexPath) as? IngredientsHeader {
                header.setTitle(title: "ingredients")
                header.backgroundColor = .white
                return header
            }
        } else if indexPath.section == 2 {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: stepsId, for: indexPath) as? StepsHeader {
                header.setTitle(title: "instruction")
                header.backgroundColor = .white
                return header
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .init(width: view.frame.width, height: view.frame.height/3)
        } else {
            return .init(width: view.frame.width, height: 50)
        }
        
        
    }
}
