//
//  PhotoCollectionViewCell.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 20/01/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell, ViewCodable {
    
    lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(photoImageView)
    }
    
    func setupConstraints() {
        photoImageView.anchor(top: topAnchor, left: leftAnchor, width: 100, height: 100)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
