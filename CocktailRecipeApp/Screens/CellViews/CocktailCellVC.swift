//
//  CocktailSearchCellVC.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation
import UIKit

class CocktailSearchCellVC: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans", size: 16)
        label.backgroundColor = .lightGray
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRecipeTitleLabel(title: String) {
        recipeTitleLabel.text = title.uppercased()
    }
    
    private func setConstrains() {
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(recipeImageView)
        containerView.addSubview(recipeTitleLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            recipeImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            recipeTitleLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 5),
            recipeTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            recipeTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            recipeTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            recipeTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
}
