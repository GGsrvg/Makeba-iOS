////
////  ObservableArray.swift
////  makeba
////
////  Created by GGsrvg on 22.10.2020.
////  Copyright © 2020 GGsrvg. All rights reserved.
////
//
//import Foundation
//
//final class ObservableArray<T> {
//    private(set) var array: [T] = []
//    
//    public func add(_ element: T) {
//        array.append(element)
//    }
//    
//    public func addArray(_ elemets: [T]) {
//        elemets.forEach {
//            self.array.append($0)
//        }
//    }
//    
//    public func insert(_ element: T, at index: Int) {
//        array.insert(element, at: index)
//    }
//    
//    public func insertArray(_ elements: [T], at index: Int) {
//        var index = index
//        elements.forEach {
//            array.insert($0, at: index)
//            index += 1
//        }
//    }
//    
//    public func clear() {
//        array = []
//    }
//    
//    public func remove(at index: Int) {
//        array.remove(at: index)
//    }
//}
