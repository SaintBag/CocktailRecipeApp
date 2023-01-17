//
//  StepsCell.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit

class StepsCell: UICollectionViewCell {
  
    private lazy var recipeText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "GillSans", size: 16)
        label.lineBreakMode = .byWordWrapping
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
    
    func setRecipeText(text: String) {
        recipeText.text = text
    }
    
    private func setUpViews() {
        
        addSubview(recipeText)
        
        NSLayoutConstraint.activate([
        
            recipeText.topAnchor.constraint(equalTo: topAnchor),
            recipeText.bottomAnchor.constraint(equalTo: bottomAnchor),
            recipeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            recipeText.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

}
