//
//  TableViewCellProtocol.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/16.
//

import Foundation
import UIKit
import Combine
public protocol TableViewCellVMProtocol where Self: AnyObject{
    var cellType: TableViewCellProtocol.Type {get}
    var cellHeight: CGFloat {set get}
    var clickContentViewSubject: PassthroughSubject<Void, Never> {get}
    var indexPath: IndexPath {set get}
}
public protocol TableViewCellProtocol where Self: AnyObject{
    init(reuseIdentifier: String, cellVM: TableViewCellVMProtocol, indexPath: IndexPath)
    func reset()
    static func cellHeight(with cellVM: TableViewCellVMProtocol, indexPath: IndexPath) -> CGFloat
}
