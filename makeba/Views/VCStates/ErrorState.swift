//
//  ErrorState.swift
//  makeba
//
//  Created by GGsrvg on 07.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class ErrorState: UIView {
    typealias ErrorButtonAction = ((ErrorState) -> Void)
    
    private var buttonAction: ErrorButtonAction? = nil
    private let withButton: Bool
    
    // MARK: - UI Elements
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: MLabel = {
        let label = MLabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var messageLabel: MLabel = {
        let label = MLabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var button: MButton = {
        let button = MButton()
        button.setTitle("Retry", for: .normal)
        button.addTarget(self, action: #selector(retryRequestSend), for: .touchUpInside)
        return button
    }()
    
    // MARK: - init
    init(withButton: Bool = true) {
        self.withButton = withButton
        super.init(frame: .zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        self.withButton = true
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.withButton = true
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
        stackView.addArrangedSubview(self.messageLabel)
        if self.withButton {
            stackView.addArrangedSubview(self.button)
        }
        
        let widthMulti = stackView.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: 0.8)
        widthMulti.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            widthMulti,
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
            
            self.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
        ])
    }
    
    @objc private func retryRequestSend() {
        self.buttonAction?(self)
    }
}

extension ErrorState {
    func setContent(title: String?, message: String?, buttonTitle: String?, buttonAction: ErrorButtonAction?) {
        self.titleLabel.text = title
        self.messageLabel.text = message
        if self.withButton {
            self.button.setTitle(buttonTitle, for: .normal)
            self.buttonAction = buttonAction
        }
    }
}
