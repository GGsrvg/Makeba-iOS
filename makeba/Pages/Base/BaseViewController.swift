//
//  BaseViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<V : UIView, VM: BaseViewModel, D : BaseInitViewController>: UIViewController {
    class func openIfCan(from viewController: UIViewController, widthData data: D?) {
        //        viewController.show(Self(), sender: nil)
    }
    
    let disposeBag: DisposeBag = DisposeBag()
    let contentView: V
    let viewModel: VM
    
    // MARK: - init
    init() {
        // init view
        self.contentView = V()
        self.viewModel = VM()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        // init view
        self.contentView = V()
        self.viewModel = VM.init()
        super.init(coder: coder)
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    // MARK: - life cycle
    override func loadView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        self.view = backgroundView
        self.view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        ])
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
        viewModel.isNeedClosed.bind(onNext: { [weak self] in
            if $0 {
                self?.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: self.disposeBag)
        viewModel.alert.bind(onNext: { [weak self] in
            switch $0 {
            case .none:
                break
            case .default(title: let title, message: let message, successTitle: let successTitle):
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let successAction = UIAlertAction(title: successTitle, style: .cancel, handler: nil)
                alertController.addAction(successAction)
                self?.present(alertController, animated: true, completion: nil)
            default:
                fatalError("\($0) dont have realization")
            }
        }).disposed(by: self.disposeBag)
        viewModel.contentState.bind(onNext: { [weak self] value in
            guard let self = self else { return }
            self.view.subviews.forEach {
                if $0.tag == 1 {
                    $0.removeFromSuperview()
                }
            }
            
            switch value {
            case .content:
                self.contentView.isHidden = false
            case .dataEmpty:
                self.contentView.isHidden = true
                let state = DataEmptyState()
                state.tag = 1
                state.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(state)
                
                NSLayoutConstraint.activate([
                    state.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    state.topAnchor.constraint(equalTo: self.view.topAnchor),
                    state.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    state.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
                
                UIView.animate(withDuration: 0.23, animations: { state.alpha = 1 })
                break
            case .loading:
                break
            case .error(message: _):
                break
            case .noInternet:
                break
            }
        }).disposed(by: disposeBag)
        
    }
    
}
