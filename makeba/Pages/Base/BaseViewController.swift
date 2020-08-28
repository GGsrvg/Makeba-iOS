//
//  BaseViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class BaseViewController<V : UIView, VM: BaseViewModel>: UIViewController {
    let _view: V
    let _viewModel: VM
    
    // MARK: - init
    init() {
        // init view
        self._view = V()
        self._viewModel = VM()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        // init view
        self._view = V()
        self._viewModel = VM()
        super.init(coder: coder)
    }
    
    // MARK: - life cycle
    override func loadView() {
        self.view = _view
    }
    
    @objc func closeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
    }
}
