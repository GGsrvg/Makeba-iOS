//
//  DataEmptyState.swift
//  makeba
//
//  Created by GGsrvg on 07.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class DataEmptyState: UIView {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = R.image.box()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    
    private func setupView() {
        self.alpha = 0
        self.addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            
            self.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
        ])
    }
}
