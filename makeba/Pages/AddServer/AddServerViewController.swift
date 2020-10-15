//
//  AddServerViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class AddServerViewController: BaseViewController<AddServerView, AddServerViewModel, AddServerInitViewController> {
    override class func openIfCan(from parentViewController: UIViewController, widthData data: AddServerInitViewController?) {
        let nextVC = Self.init()
        parentViewController.navigationController?.show(nextVC, sender: nil)
    }
    
    required override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var saveHostBarButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setImage(UIImage(systemName: "save"), for: .normal)
        button.frame.size = .init(width: 30, height: 30)
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupBinding()
    }
    
    private func setupBinding() {
        (contentView.hostPathTextField.rx.text <-> viewModel.hostPath).disposed(by: disposeBag)
        (contentView.hostNameTextField.rx.text <-> viewModel.hostName).disposed(by: disposeBag)
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = "Host"
        self.navigationItem.setRightBarButton(saveHostBarButton, animated: true)
    }
    
    @objc private func saveAction() {
        self.view.endEditing(true)
        self.viewModel.save()
    }
}
