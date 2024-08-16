//
//  WDQVC.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/15.
//

import UIKit

open class WDQVC: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
}



extension WDQVC : UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
