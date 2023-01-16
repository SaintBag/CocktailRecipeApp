//
//  CocktailCellVC.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import Foundation
import UIKit

class CocktailCellVC: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.text = "CELL HERE HEllo"
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
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            
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
        //        recipeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        //        recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        //        recipeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        //        recipeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
                
        //    }
    }
}
