//
//  ViewController.swift
//  WDQExtension
//
//  Created by WangDeqian on 08/14/2024.
//  Copyright (c) 2024 WangDeqian. All rights reserved.
//

import UIKit
import WDQExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wdq.monitorNetworkReachability().sink { value in
            print("网络\(value)")
        }.store(in: &cancellables)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

