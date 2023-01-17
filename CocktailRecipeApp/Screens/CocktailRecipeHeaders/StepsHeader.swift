//
//  StepsHeader.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit

final class StepsHeader: UICollectionReusableView {
    
    private lazy var stepsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans", size: 25)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        stepsLabel.text = title.uppercased()
    }
    
    private func setupViews() {
        
        addSubview(stepsLabel)
        
        NSLayoutConstraint.activate([
        
            stepsLabel.topAnchor.constraint(equalTo: topAnchor),
            stepsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            stepsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        ])
        
    }
}

