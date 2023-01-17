//
//  IngredientsHeader.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 17/01/2023.
//

import UIKit

final class IngredientsHeader: UICollectionReusableView {
        
    private lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans", size: 25)
        label.backgroundColor = .white
        label.textColor = .systemPink
        label.textAlignment = .left
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setTitle(title: String) {
        ingredientsLabel.text = title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(ingredientsLabel)
        
        NSLayoutConstraint.activate([
        
            ingredientsLabel.topAnchor.constraint(equalTo: topAnchor),
            ingredientsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            ingredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        ])
    }
}

