//
//  HomeViewController.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 19/01/21.
//

import UIKit

class HomeViewController: UIViewController, ViewCodable {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.setTitle("Apply filter", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonApplyFilterPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func buildViewHierarchy() {
        view.addSubview(image)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        image.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: view.frame.size.height * 0.7)
        
        button.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, height: 60)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        configureNavigationBar(withTitle: "Camera Filter", prefersLargeTitles: true)
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonRightPressed))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func buttonRightPressed() {
        let controller = PhotosCollectionViewController()
        present(controller, animated: true, completion: nil)
    }
    
    @objc func buttonApplyFilterPressed() {
        print("Button pressed")
    }
}
