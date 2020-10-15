//
//  NoInternetState.swift
//  makeba
//
//  Created by GGsrvg on 07.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class NoInternetState: UIView {
    // MARK: - UI Elements
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    // MARK: - setup view
    private func setupView() {
        
    }
    
}
