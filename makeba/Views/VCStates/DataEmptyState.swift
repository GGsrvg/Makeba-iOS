//
//  DataEmptyState.swift
//  makeba
//
//  Created by GGsrvg on 07.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

/**
View for state when data not have value
 */
class DataEmptyState: UIView {
    typealias DataEmptyRetryAction = ((DataEmptyState) -> Void)
    
    private var retryAction: DataEmptyRetryAction? = nil
    
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.addTarget(self, action: #selector(retryRequestSend), for: .touchUpInside)
        return button
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
        self.addSubview(self.stackView)
        
        stackView.addArrangedSubview(self.imageView)
        stackView.addArrangedSubview(self.titleLabel)
        stackView.addArrangedSubview(self.messageLabel)
        stackView.addArrangedSubview(self.button)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            
            self.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
        ])
    }
    
    @objc private func retryRequestSend() {
        self.retryAction?(self)
    }
}

extension DataEmptyState {
    func setContent(image: UIImage?, title: String?, message: String?, retryTitle: String?, retryAction: DataEmptyRetryAction?) {
        self.imageView.image = image
        self.titleLabel.text = title
        self.messageLabel.text = message
        self.button.setTitle(retryTitle, for: .normal)
        self.retryAction = retryAction
    }
}
