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
    override class func openIfCan(widthData data: AddServerInitViewController?) -> Self {
        let vc = AddServerViewController()
        if let data = data {
            vc.contentView.hostNameTextField.text = data.server.name
            vc.contentView.hostPathTextField.text = data.server.path
            vc.contentView.hostPathTextField.isEnabled = false
            vc.viewModel.server = data.server
        }
        return vc as! Self
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
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = "Host"
        self.navigationItem.setRightBarButton(saveHostBarButton, animated: true)
    }
    
    @objc private func saveAction() {
        self.view.endEditing(true)
        self.viewModel.save(hostPath: self.contentView.hostPathTextField.text,
                            hostName: self.contentView.hostNameTextField.text)
    }
}
