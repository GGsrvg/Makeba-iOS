//
//  AddServerView.swift
//  makeba
//
//  Created by GGsrvg on 03.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import InputMask

class AddServerView: UIView {
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var hostPathLabel: UILabel = {
        let label = UILabel()
        label.text = "Host path"
        return label
    }()
    
    lazy var hostPathTextField: UIMTextField = {
        let textField = UIMTextField()
        textField.keyboardType = .URL
        textField.placeholder = "0.0.0.0"
        textField.layer.borderColor = UIColor.tertiaryLabel.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 6
        textField.padding = .init(top: 6, left: 8, bottom: 6, right: 8)
        return textField
    }()
    
    lazy var hostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Host name"
        return label
    }()
    
    lazy var hostNameTextField: UIMTextField = {
        let textField = UIMTextField()
        textField.placeholder = "My stats"
        textField.layer.borderColor = UIColor.tertiaryLabel.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 6
        textField.padding = .init(top: 6, left: 8, bottom: 6, right: 8)
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // setting self
        backgroundColor = .systemBackground
        addSubview(contentStackView)
        // setup content
        contentStackView.addArrangedSubview(hostPathLabel)
        contentStackView.addArrangedSubview(hostPathTextField)
        contentStackView.addArrangedSubview(hostNameLabel)
        contentStackView.addArrangedSubview(hostNameTextField)
        // setop constraints
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1.0),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
            self.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
        ])
    }
    
}
