//
//  UIHelper.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/14.
//

import Foundation
import UIKit

extension WDQExtension {
    
    private func commondSetLayerSet(view: UIView, 
                                    layerSet: LayerSet) {
        view.layer.cornerRadius = layerSet.cornerRadius ?? 0
        view.layer.borderWidth = layerSet.borderWidth ?? 0
        view.layer.borderColor = layerSet.borderColor?.cgColor
        view.clipsToBounds = true
    }
    
    /// 创建label
    public func label(text: String?, 
                      font: UIFont?,
                      textColor: UIColor?,
                      textAlignment: NSTextAlignment = .left,
                      layerSet: LayerSet?) -> WDQLabel {
        let label = WDQLabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        if let layerSet {
            self.commondSetLayerSet(view: label as UIView, layerSet: layerSet)
        }
        return label
    }
    
    /// 创建一个imageView
    public func imageView(contentMode: UIView.ContentMode = .scaleAspectFill, 
                          layerSet: LayerSet?,
                          clipsToBounds: Bool = true,
                          image: UIImage?) -> WDQImageView {
        let imageView = WDQImageView()
        imageView.contentMode = contentMode
        imageView.clipsToBounds = clipsToBounds
        imageView.image = image
        if let layerSet {
            self.commondSetLayerSet(view: imageView as UIView, layerSet: layerSet)
        }
        return imageView
    }
    
    /// 创建按钮
    public func button(layerSet: LayerSet?, 
                       buttonItems: [ButtonItem]) -> WDQButton {
        
        //config样式
        var config = UIButton.Configuration.plain()
        
        config.baseBackgroundColor = .clear //设置选中状态下有背景色的问题
        //设置按压没抬起时文本变色的问题
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            for item in buttonItems {
                if item.state == .normal {
                    outgoing.foregroundColor = item.titleColor
                }
            }
            return outgoing
        })
        
        //设置config的间距
        for item in buttonItems {
            if item.state == .normal {
                if let imageLayout = item.imageLayout {
                    config.imagePlacement = imageLayout.imagePosition
                    config.imagePadding = imageLayout.imageSpace
                    config.background.image = item.bgImage
                }
            }
        }
        
        //设置圆角
        config.background.cornerRadius = layerSet?.cornerRadius ?? 0
        
        let btn = WDQButton(configuration: config)
        btn.buttonItems = buttonItems
        
        //设置内容
        for item in buttonItems {
            if item.state == .normal {
                btn.setTitle(item.title, for: .normal)
                btn.setImage(item.image, for: .normal)
                btn.setTitleColor(item.titleColor, for: .normal)
                btn.titleLabel?.font = item.font
            }
        }
        
        //设置圆角等
        if let layerSet {
            btn.layer.borderWidth = layerSet.borderWidth ?? 0
            btn.layer.borderColor = layerSet.borderColor?.cgColor
            btn.clipsToBounds = true
        }
        
        return btn
    }
    
    
    /// 创建TextField
    /// - Returns: WDQTextField
    public func textField(font: UIFont?,
                          text: String?,
                          textColor: UIColor?,
                          textAlignment: NSTextAlignment,
                          bgColor: UIColor?,
                          tintColor: UIColor?,
                          leftView: TextFieldAssistView?,
                          rightView: TextFieldAssistView?,
                          attributedPlaceholder: NSAttributedString?,
                          layerSet: LayerSet?)
    -> WDQTextField {
        let t = WDQTextField()
        t.font = font
        t.text = text
        t.textColor = textColor
        t.textAlignment = textAlignment
        t.backgroundColor = bgColor
        t.tintColor = tintColor
        if let leftView {
            t.leftView = leftView.view
            t.leftViewMode = leftView.viewMode
        }
        if let rightView {
            t.rightView = rightView.view
            t.rightViewMode = rightView.viewMode
        }
        t.attributedPlaceholder = attributedPlaceholder
        if let layerSet {
            self.commondSetLayerSet(view: t as UIView, layerSet: layerSet)
        }
        return t
    }
    
    public func textView(font: UIFont?, 
                         text: String?,
                         textColor: UIColor?,
                         bgColor: UIColor?,
                         textAlignment: NSTextAlignment,
                         attributedPlaceholder: NSAttributedString?,
                         tintColor: UIColor?,
                         maximumNumberOfLines: Int,
                         layerSet: LayerSet?) -> WDQTextView {
        let t = WDQTextView()
        t.font = font
        t.text = text
        t.textColor = textColor
        t.backgroundColor = bgColor
        t.textAlignment = textAlignment
        t.attributedPlaceholder = attributedPlaceholder
        t.tintColor = tintColor
        t.maximumNumberOfLines = maximumNumberOfLines
        if let layerSet {
            self.commondSetLayerSet(view: t as UIView, layerSet: layerSet)
        }
        return t
    }
    
    public func scrollView(contentSize: CGSize, 
                           bounces: Bool = true,
                           pagingEnabled: Bool = false) -> WDQScrollView {
        let s = WDQScrollView()
        s.contentSize = contentSize
        s.bounces = bounces
        s.isPagingEnabled = pagingEnabled
        return s
    }
    
}
