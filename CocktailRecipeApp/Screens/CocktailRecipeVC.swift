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
    
    init(id: String) {
        self.id = id
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if id == "15346" {
            collectionView.backgroundColor = .cyan
        } else {
            collectionView.backgroundColor = .lightGray
        }
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
