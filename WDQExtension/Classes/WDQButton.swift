//
//  WDQButton.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/14.
//

import UIKit
open class WDQButton: UIButton {
    
    public override var isSelected: Bool {
        didSet{
            if self.isSelected == false {
                if self.isEnabled == true {
                    //普通状态
                    for item in self.buttonItems {
                        if item.state == .normal {
                            self.configNormal(item: item)
                        }
                    }
                    return
                }
            }
            for item in buttonItems {
                if item.state == .selected {
                    self.setTitle(item.title, for: .selected)
                    self.setImage(item.image, for: .selected)
                    self.setTitleColor(item.titleColor, for: .selected)
                    self.configuration?.background.image = item.bgImage
                    self.titleLabel?.font = item.font
                    if let imageLayout = item.imageLayout{
                        var config = self.configuration
                        config?.imagePlacement = imageLayout.imagePosition
                        config?.imagePadding = imageLayout.imageSpace
                        self.configuration = config
                    }
                    self.updateConfiguration()
                }
            }
        }
    }
    
    
    public override var isEnabled: Bool{
        didSet{
            if self.isEnabled == true {
                if self.isSelected == false {
                    //普通状态
                    for item in self.buttonItems {
                        if item.state == .normal {
                            self.configNormal(item: item)
                        }
                    }
                    return
                }
            }
            for item in buttonItems {
                if item.state == .disabled {
                    self.setTitle(item.title, for: .disabled)
                    self.setImage(item.image, for: .disabled)
                    self.setTitleColor(item.titleColor, for: .disabled)
                    self.configuration?.background.image = item.bgImage
                    self.titleLabel?.font = item.font
                    if let imageLayout = item.imageLayout{
                        var config = self.configuration
                        config?.imagePlacement = imageLayout.imagePosition
                        config?.imagePadding = imageLayout.imageSpace
                        self.configuration = config
                    }
                    self.updateConfiguration()
                }
            }
        }
    }
    
    
    open override var isHighlighted: Bool {
        get {
            return false // 始终不允许按钮进入高亮状态
        }
        set {
            // 不执行任何操作，保持高亮状态为 false
        }
    }
    
    
    private func configNormal(item: ButtonItem) {
        self.setTitle(item.title, for: .normal)
        self.setImage(item.image, for: .normal)
        self.setTitleColor(item.titleColor, for: .normal)
        self.configuration?.background.image = item.bgImage
        self.titleLabel?.font = item.font
        if let imageLayout = item.imageLayout{
            var config = self.configuration
            config?.imagePlacement = imageLayout.imagePosition
            config?.imagePadding = imageLayout.imageSpace
            self.configuration = config
        }
        self.updateConfiguration()
    }
    
    
}



