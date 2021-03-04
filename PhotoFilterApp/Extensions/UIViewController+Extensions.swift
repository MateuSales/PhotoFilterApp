//
//  UIViewController+Extensions.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 19/01/21.
//

import UIKit

extension UIViewController {
    
    func configureNavigationBar(withTitle title: String, prefersLargeTitles: Bool) {
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.backgroundColor = .systemOrange
        
        let navBar = navigationController?.navigationBar
        navBar?.compactAppearance = appearence
        navBar?.standardAppearance = appearence
        navBar?.scrollEdgeAppearance = appearence
        
        navBar?.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        navBar?.tintColor = .white
        navBar?.isTranslucent = true
        
        navBar?.overrideUserInterfaceStyle = .dark
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
