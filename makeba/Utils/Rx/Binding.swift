//
//  Binding.swift
//  makeba
//
//  Created by GGsrvg on 01.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - HOW USE?
/*
    FirstElement "operator" SecondElement
 
    FirstElement - it's UI element (UITextField, UILabel, UITextView)
    SecondElement - it's element from ViewModel
 
    Use this rule for easy code maintenance
*/

// MARK: - Two Way Binding
infix operator <-> : DefaultPrecedence

func <-> <T>(property: ControlProperty<T>, relay: BehaviorRelay<T>) -> Disposable {
    let bindToUIDisposable = relay.bind(to: property)
    let bindToRelay = property
        .subscribe(onNext: { n in
            relay.accept(n)
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })

    return Disposables.create(bindToUIDisposable, bindToRelay)
}

// MARK: - One Way Binding
infix operator <-- : DefaultPrecedence

func <-- <T>(property: ControlProperty<T>, relay: BehaviorRelay<T>) -> Disposable {
    let bind = relay.bind(to: property)
    return bind
}

infix operator --> : DefaultPrecedence

func --> <T>(property: ControlProperty<T>, relay: BehaviorRelay<T>) -> Disposable {
    let bind = property.bind(to: relay)
    return bind
}
