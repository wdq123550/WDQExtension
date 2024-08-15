//
//  ViewController.swift
//  WDQExtension
//
//  Created by WangDeqian on 08/14/2024.
//  Copyright (c) 2024 WangDeqian. All rights reserved.
//

import UIKit
import WDQExtension
import SnapKit
import Alamofire
import RSKGrowingTextView

class ViewController: WDQVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        wdq.monitorNetworkReachability().sink { isSuccess in
//            print(isSuccess)
//        }.store(in: &cancellables)
        
//        let btn = wdq.button(layerSet: nil, buttonItems: [
//            ButtonItem(title: "普通状态", image: UIImage(named: "kefu"), titleColor: .red, bgImage: UIImage(color: .green), font: .systemFont(ofSize: 30, weight: .bold), imageLayout: ButtonImageLayout(imagePosition: .leading, imageSpace: 12), state: .normal),
//            
//            ButtonItem(title: "选中状态", image: UIImage(named: "gou"), titleColor: .orange, bgImage: UIImage(color: .green.withAlphaComponent(0.3)), font: .systemFont(ofSize: 16, weight: .regular), imageLayout: ButtonImageLayout(imagePosition: .top, imageSpace: 10), state: .disabled),
//        ])
//        
//        self.view.addSubview(btn)
//        btn.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
//            make.height.equalTo(50)
//        }
//        
//        btn.addAction(UIAction(handler: { [unowned btn] _ in
//            btn.isEnabled = !btn.isEnabled
//        }), for: .touchUpInside)
        
        
//        let leftView = UIView()
//        leftView.frame = CGRectMake(0, 0, 30, 20)
////        
//        let textField = wdq.textField(font: .systemFont(ofSize: 16, weight: .semibold), text: nil, textColor: .black, textAlignment: .center, bgColor: .gray, tintColor: .red, leftView: TextFieldAssistView(viewMode: .always, view: leftView), rightView: nil, attributedPlaceholder: NSAttributedString(string: "请输入内容", attributes: [
//            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
//            .foregroundColor: UIColor.lightGray
//        ]), layerSet: LayerSet(cornerRadius: 25, borderWidth: 2, borderColor: .black))
//        
//        self.view.addSubview(textField)
//        textField.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
//            make.height.equalTo(50)
//            make.centerY.equalToSuperview()
//        }
        
//        let t = wdq.textView(font: .systemFont(ofSize: 24, weight: .bold), text: nil, textColor: .black, bgColor: .lightGray, textAlignment: .center, attributedPlaceholder: NSAttributedString(string: "请输入内容", attributes: [
//            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
//            .foregroundColor: UIColor.gray
//        ]), tintColor: .red, maximumNumberOfLines: 1, layerSet: LayerSet(cornerRadius: 5, borderWidth: 2, borderColor: .black))
////        t.delegate = self
//        self.view.addSubview(t)
//        t.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
//            make.centerY.equalToSuperview()
//        }
        
//        let t = wdq.toggle(thumbTintColor: .black, onTintColor: .red)
//        self.view.addSubview(t)
//        t.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

