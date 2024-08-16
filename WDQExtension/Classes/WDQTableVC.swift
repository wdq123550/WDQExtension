//
//  WDQTableVC.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/16.
//

import UIKit

open class WDQTableVC: UITableViewController {

    //MARK: - init
    public init(startPage: Int, style: UITableView.Style){
        self.startPage = startPage
        super.init(style: style)
    }
    
    //MARK: - public property
    
    
    //MARK: - public method
    public func refresh(with type: RefreshType, _ refresh: (_ refreshCallback: @escaping ([Any]) -> Void) -> Void){
        refresh({ [weak self] datas in
            guard let self else{ return }
            DispatchQueue.main.async {
                if type == .new {
                    self.page = self.startPage
                    self.datas = datas
                    self.tableView.reloadData()
                }else{
                    if datas.count == 0 {
                        return
                    }
                    self.page += 1
                    let count = self.datas.count
                    let isArray = datas.contains(where: { any in
                        return any is Array<TableViewCellVMProtocol>
                    })
                    self.datas.append(datas)
                    if isArray {
                        self.tableView.insertSections([count], with: .fade)
                    }else{
                        var indexPaths = [IndexPath]()
                        for (index, item) in self.datas.enumerated() {
                            let indexPath = IndexPath(row: index + count, section: 0)
                            indexPaths.append(indexPath)
                        }
                        self.tableView.insertRows(at: indexPaths, with: .fade)
                    }
                }
            }
        })
    }
    
    public func deleteRowsInDefultSection(with viewModels: [TableViewCellVMProtocol]){
        for viewModel_forin in viewModels {
            let index = self.datas.firstIndex { viewModel in
                viewModel_forin === (viewModel as! TableViewCellVMProtocol)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - private property
    private var datas: [Any] = [Any]()
    private var page: Int = 1
    private var startPage: Int
    
    //MARK: - override method
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    //MARK: - not available
    public override init(style: UITableView.Style) {
        fatalError("init(style:) not available")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName: bundle:) not available")
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
