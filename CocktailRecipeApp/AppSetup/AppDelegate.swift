//
//  AppDelegate.swift
//  CocktailRecipeApp
//
//  Created by Sebastian on 16/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setupNavigationBarColors()
        //        let flowLayout = UICollectionViewFlowLayout()
        let vc = CocktailSearchVC()
        let nc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nc
        
        return true
    }
    
    private func setupNavigationBarColors() {
        UINavigationBar.appearance().barTintColor = .systemPink
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}