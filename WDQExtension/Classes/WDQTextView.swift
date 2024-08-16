//
//  WDQTextView.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/15.
//

import UIKit
import RSKGrowingTextView
import RxCocoa
open class WDQTextView: RSKGrowingTextView {
    init(){
        super.init(frame: .zero, textContainer: nil)
        
        //解决中英文数字混合输入会导致的意外换行问题
        self.rx.text.subscribe { text in
            let attrM = self.attributedText?.mutableCopy() as! NSMutableAttributedString
            let style = NSMutableParagraphStyle()
            style.lineBreakMode = .byCharWrapping
            attrM.addAttributes([
                .paragraphStyle: style
            ], range: NSMakeRange(0, attrM.length))
            self.attributedText = attrM
        }.disposed(by: disposeBag)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
