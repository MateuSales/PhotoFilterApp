//
//  HomeViewController.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 19/01/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        configureNavigationBar(withTitle: "Camera", prefersLargeTitles: true)
    }
}
