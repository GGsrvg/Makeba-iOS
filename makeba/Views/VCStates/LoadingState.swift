//
//  LoadingState.swift
//  makeba
//
//  Created by GGsrvg on 07.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class LoadingState: UIView {
    // MARK: - UI Elements
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Loading"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var refresh: UIActivityIndicatorView = {
        let refresh = UIActivityIndicatorView()
        refresh.startAnimating()
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
        self.alpha = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.stackView)
        
        stackView.addArrangedSubview(self.titleLabel)
        stackView.addArrangedSubview(self.refresh)
        
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
        ])
        
    }
}
