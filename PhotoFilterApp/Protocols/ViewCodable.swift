//
//  ViewCodable.swift
//  PhotoFilterApp
//
//  Created by Mateus Sales on 19/01/21.
//

import Foundation

protocol ViewCodable: class {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
