//
//  ObjectExtension.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/14.
//

import Foundation
import Combine
import RxSwift

private var cancellablesKey: UInt8 = 0
private var disposeBagKey: UInt8 = 0

extension NSObject {
    
    // 关联的 Set<AnyCancellable> 属性
    public var cancellables: Set<AnyCancellable> {
        get {
            if let value = objc_getAssociatedObject(self, &cancellablesKey) {
                return value as! Set<AnyCancellable>
            } else {
                let initialValue = Set<AnyCancellable>()
                objc_setAssociatedObject(self, &cancellablesKey, initialValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return initialValue
            }
        }
        set {
            objc_setAssociatedObject(self, &cancellablesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // 关联的 DisposeBag 属性
    public var disposeBag: DisposeBag {
        get {
            if let value = objc_getAssociatedObject(self, &disposeBagKey) {
                return value as! DisposeBag
            } else {
                let initialValue = DisposeBag()
                objc_setAssociatedObject(self, &disposeBagKey, initialValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return initialValue
            }
        }
        set {
            objc_setAssociatedObject(self, &disposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

