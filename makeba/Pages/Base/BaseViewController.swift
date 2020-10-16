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
    
    private var oldState: UIView? = nil
    
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
        // init base view
        self.view = UIView()
        self.view.backgroundColor = .systemBackground
        // configare contentView
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToObservable()
    }
    
    func retryRequest() {
        
    }
    
    @objc func closeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        //        dismiss(animated: true, completion: nil)
    }
    
    private func subscribeToObservable() {
        // when value is true, then view controller close
        viewModel.isNeedClosed.bind(onNext: { [weak self] in
            if $0 {
                self?.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: self.disposeBag)
        // alert
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
        // content state
        viewModel.contentState.bind(onNext: { [weak self] state in
            self?.changeState(state)
        }).disposed(by: disposeBag)
    }
}

extension BaseViewController {
    private func changeState(_ state: VCStates) {
        func showState(_ state: UIView) {
            state.isHidden = false
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
                state.alpha = 1
            })
        }
        
        func hideState(_ state: UIView) {
            state.isHidden = true
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                state.alpha = 0
            })
        }
        
        func hideContent() {
            hideState(self.contentView)
        }
        
        func removeOldState() {
            guard let oldState = self.oldState else {
                return
            }
            
            hideState(oldState)
            oldState.removeFromSuperview()
        }
        
        func setState(_ state: UIView) {
            hideContent()
            
            self.oldState = state
            self.view.addSubview(state)
            
            NSLayoutConstraint.activate([
                state.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                state.topAnchor.constraint(equalTo: self.view.topAnchor),
                state.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                state.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
        }
        
        removeOldState()
        
        let needShowState: UIView
        
        switch state {
        case .content:
            needShowState = self.contentView
        case .loading:
            let loading = LoadingState()
            setState(loading)
            needShowState = loading
        case .error(title: let title, message: let message, retryTitle: let buttonTitle, retryAction: let action):
            let error = ErrorState()
            setState(error)
            error.setContent(title: title, message: message, retryTitle: buttonTitle, retryAction: action)
            needShowState = error
        case .dataEmpty:
            let error = ErrorState(withButton: false)
            setState(error)
            error.setContent(title: "Data Empty", message: "Data don't have values", retryTitle: "Retry", retryAction: { _ in self.retryRequest() })
            needShowState = error
        case .noInternet:
            let error = ErrorState()
            setState(error)
            error.setContent(title: "No Internet", message: "Please check your internet access", retryTitle: "Retry", retryAction: { _ in self.retryRequest() })
            needShowState = error
        }
        
        
        showState(needShowState)
    }
}
