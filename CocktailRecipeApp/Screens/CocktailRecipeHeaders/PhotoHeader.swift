//
//  PhotoHeader.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit

final class PhotoHeader: UICollectionReusableView {
    
    lazy var recipePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setImageTitleLabel(title: String) {
        imageTitleLabel.text = title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(recipePhoto)
        addSubview(imageTitleLabel)
        NSLayoutConstraint.activate([
        
            recipePhoto.topAnchor.constraint(equalTo: topAnchor),
            recipePhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            recipePhoto.trailingAnchor.constraint(equalTo: trailingAnchor),
            recipePhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            imageTitleLabel.topAnchor.constraint(equalTo: recipePhoto.bottomAnchor),
            imageTitleLabel.centerXAnchor.constraint(equalTo: recipePhoto.centerXAnchor),
            imageTitleLabel.widthAnchor.constraint(equalTo: recipePhoto.widthAnchor),
            imageTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])        
    }
}
