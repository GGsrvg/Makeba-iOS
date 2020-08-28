//
//  AddServerViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class AddServerViewController: BaseViewController<AddServerView, AddServerViewModel> {
    
    lazy var saveHostBarButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setImage(UIImage(systemName: "save"), for: .normal)
        button.frame.size = .init(width: 30, height: 30)
//        button.addTarget(self, action: #selector(goToAddServer), for: .touchUpInside)
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
}
