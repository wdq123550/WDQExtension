//
//  WDQExtension.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/14.
//

import Foundation
import Alamofire
import Combine
import AVFoundation
import Photos
import CoreLocation
import RxSwift
import RxCocoa
import SVProgressHUD
import UIKit

public let wdq = WDQExtension()

open class WDQExtension: NSObject {
    internal var locationManager = CLLocationManager()
    internal var locationPermissionsSubject: PassthroughSubject<Bool, Never>?
    internal var locationPermissionsLevel: LocationPermissionsLevel?
    internal let networkManager = NetworkReachabilityManager(host: "www.apple.com")!
}

public let scrollViewSpecialTagForNavigation = 1001

public enum LocationPermissionsLevel {
    case whenInUse
    case always
}

public struct LayerSet {
    var cornerRadius: CGFloat?
    var borderWidth: CGFloat?
    var borderColor: UIColor?
    
    public init(cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}


public struct ButtonImageLayout {
    public var imagePosition: NSDirectionalRectEdge
    public var imageSpace: CGFloat
    
    public init(imagePosition: NSDirectionalRectEdge, imageSpace: CGFloat) {
        self.imagePosition = imagePosition
        self.imageSpace = imageSpace
    }
}

public struct ButtonItem {
    public var title: String?
    public var image: UIImage?
    public var titleColor: UIColor?
    public var bgImage: UIImage?
    public var font: UIFont?
    public var imageLayout: ButtonImageLayout?
    public var state: UIControl.State
    
    public init(title: String? = nil, image: UIImage? = nil, titleColor: UIColor? = nil, bgImage: UIImage? = nil, font: UIFont? = nil, imageLayout: ButtonImageLayout? = nil, state: UIControl.State) {
        self.title = title
        self.image = image
        self.titleColor = titleColor
        self.bgImage = bgImage
        self.font = font
        self.imageLayout = imageLayout
        self.state = state
    }
}

public struct TextFieldAssistView {
    var viewMode: UITextField.ViewMode
    var view: UIView
    
    public init(viewMode: UITextField.ViewMode, view: UIView) {
        self.viewMode = viewMode
        self.view = view
    }
}


//MARK: - extension

private var cancellablesKey: UInt8 = 0
private var disposeBagKey: UInt8 = 0
private var buttonItemsKey: UInt8 = 0

//MARK: NSObject
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

//MARK: Button
public extension WDQButton {
    // 关联 [ButtonItem] 属性
    var buttonItems: [ButtonItem] {
        get {
            if let value = objc_getAssociatedObject(self, &buttonItemsKey) {
                return value as! [ButtonItem]
            } else {
                let initialValue = [ButtonItem]()
                objc_setAssociatedObject(self, &buttonItemsKey, initialValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return initialValue
            }
        }
        set {
            objc_setAssociatedObject(self, &buttonItemsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

//MARK: UIImage
public extension UIImage {
    convenience init?(color: UIColor) {
        // 创建一个 1x1 的矩形
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        // 在这个范围内开启一段上下文
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        // 设置上下文的填充颜色
        context.setFillColor(color.cgColor)
        // 用这个颜色填充这个上下文
        context.fill(rect)
        // 从上下文中获取 UIImage 并结束上下文
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // 使用获取到的 UIImage 初始化
        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
}
