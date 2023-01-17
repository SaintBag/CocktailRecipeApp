//
//  IngredientsCell.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit

class IngredientsCell: UICollectionViewCell {

    private lazy var ingredientLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIngredientLabel(text: String) {
        ingredientLabel.text = text
    }
    
    private func setUpViews() {
        
        addSubview(ingredientLabel)
        NSLayoutConstraint.activate([
        
            ingredientLabel.topAnchor.constraint(equalTo: topAnchor),
            ingredientLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            ingredientLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}

