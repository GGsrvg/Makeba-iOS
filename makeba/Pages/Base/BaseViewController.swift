//
//  BaseViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<V : UIView, VM: BaseViewModel>: UIViewController {
    let disposeBag: DisposeBag = DisposeBag()
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
        self._viewModel = VM.init()
        super.init(coder: coder)
    }
    
    // MARK: - life cycle
    override func loadView() {
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToObservable()
    }
    
    @objc func closeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
    }
    
    private func subscribeToObservable() {
        _viewModel.isNeedClosed.bind(onNext: {
            if $0 {
                self.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: self.disposeBag)
        _viewModel.alert.bind(onNext: {
            switch $0 {
            case .none:
                break
            case .default(title: let title, message: let message, successTitle: let successTitle):
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let successAction = UIAlertAction(title: successTitle, style: .cancel, handler: nil)
                alertController.addAction(successAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }).disposed(by: self.disposeBag)
    }
}
