//
//  HomeViewController.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 19/01/21.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, ViewCodable {
    
    let disposeBag = DisposeBag()
    
    lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        return image
    }()
    
    lazy var buttonApplyFilter: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.setTitle("Apply filter", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonApplyFilterPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func buildViewHierarchy() {
        view.addSubview(photoImageView)
        view.addSubview(buttonApplyFilter)
    }
    
    func setupConstraints() {
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: view.frame.size.height * 0.7)
        
        buttonApplyFilter.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, height: 60)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        configureNavigationBar(withTitle: "Camera Filter", prefersLargeTitles: true)
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonRightPressed))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func buttonRightPressed() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        let controller = PhotosCollectionViewController(collectionViewLayout: layout)
        
        controller.selectedPhoto.subscribe(onNext: { [weak self] photo in
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
                
            }
            
        }).disposed(by: disposeBag)
        
        present(controller, animated: true, completion: nil)
    }
    
    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.buttonApplyFilter.isHidden = false
    }
    
    @objc func buttonApplyFilterPressed() {
        
        guard let sourceImage = self.photoImageView.image else { return }
        
        FilterService().applyFilter(to: sourceImage).subscribe(onNext: { filteredImage in
            
            DispatchQueue.main.async {
                self.photoImageView.image = filteredImage
            }
            
        }).disposed(by: disposeBag)
        
        
    }
}
