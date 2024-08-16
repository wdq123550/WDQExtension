//
//  WDQTableViewCell.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/16.
//

import UIKit
import Combine
open class WDQTableViewCellVM: NSObject, TableViewCellVMProtocol {
    public var cellType: any TableViewCellProtocol.Type {
        WDQTableViewCell.self
    }
    public var cellHeight: CGFloat = 0
    public var clickContentViewSubject: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    public var indexPath: IndexPath = IndexPath(row: 0, section: 0)
}

open class WDQTableViewCell: UITableViewCell, TableViewCellProtocol {
    
    public var viewModel: TableViewCellVMProtocol
    
    public required init(reuseIdentifier: String, cellVM: any TableViewCellVMProtocol, indexPath: IndexPath) {
        self.viewModel = cellVM
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.viewModel.indexPath = indexPath
    }
    
    public func reset() {
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func cellHeight(with cellVM: any TableViewCellVMProtocol, indexPath: IndexPath) -> CGFloat {
        0
    }
    
    
}
