//
//  ViewCode.swift
//  FirstViewCodeProject
//
//  Created by Jessica Sampaio on 27/05/24.
//

import Foundation

protocol ViewCode {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewCode {
    func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
}
