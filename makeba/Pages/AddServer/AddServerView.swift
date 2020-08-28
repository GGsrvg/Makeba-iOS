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
    
    lazy var listener: MaskedTextFieldDelegate = {
        let chSet: CharacterSet = .init(charactersIn: ".")
        let listener: MaskedTextFieldDelegate =  MaskedTextFieldDelegate(primaryFormat: "[099]{.}[099]{.}[099]{.}[099]", autocomplete: false, autocompleteOnFocus: false, autoskip: false, rightToLeft: false, affineFormats: [], affinityCalculationStrategy: .capacity, customNotations: [Notation(character: ",", characterSet: chSet, isOptional: false)], onMaskedTextChangedCallback: nil)
        return listener
    }()
    
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
    
    lazy var hostPathTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = listener
        textField.placeholder = "0.0.0.0"
        textField.layer.borderColor = UIColor.tertiaryLabel.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var hostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Host path"
        return label
    }()
    
    lazy var hostNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "My stats"
        textField.layer.borderColor = UIColor.tertiaryLabel.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    lazy var hostDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Host path"
        return label
    }()
    
    lazy var hostDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = listener
        textField.placeholder = "Server status"
        textField.layer.borderColor = UIColor.tertiaryLabel.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .decimalPad
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
        contentStackView.addArrangedSubview(hostDescriptionLabel)
        contentStackView.addArrangedSubview(hostDescriptionTextField)
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
