//
//  WDQNavigationVC.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/15.
//

import UIKit

open class WDQNavigationVC: UINavigationController, UIGestureRecognizerDelegate {

    var backImage: UIImage
    
    required public init(rootVc: UIViewController, backImage: UIImage){
        self.backImage = backImage
        super.init(rootViewController: rootVc)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(rootViewController: UIViewController) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let target = self.interactivePopGestureRecognizer?.delegate
        let selector = NSSelectorFromString("handleNavigationTransition:")
        let targetView = self.interactivePopGestureRecognizer?.view
        
        let fullScreenGes = UIPanGestureRecognizer(target: target, action: selector)
        fullScreenGes.delegate = self
        targetView?.addGestureRecognizer(fullScreenGes)
        self.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        
        if (self.children.count > 1) {
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(image: self.backImage, style: .plain, target: self, action: #selector(self.back))
        }
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let panGes = gestureRecognizer as! UIPanGestureRecognizer
        if self.children.count == 1 {
            return false
        }
        let isTransitioning = self.value(forKey: "_isTransitioning") as! Bool
        if isTransitioning {//控制器正在返回中
            return false
        }
        let translation = panGes.translation(in: panGes.view)
        if translation.x <= 0 {
            return false
        }
        return true
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let condition1 = (otherGestureRecognizer.view?.isKind(of: UITableView.self))!
        let condition2 = otherGestureRecognizer.view?.tag == scrollViewSpecialTagForNavigation
        if condition1 && condition2 {
            let tableView = otherGestureRecognizer.view as! UITableView
            if tableView.isEditing {
                tableView.isEditing = false
                return true
            }
        }
        
        let condition3 = (otherGestureRecognizer.view?.isKind(of: UIScrollView.self))!
        if condition3 && condition2 {
            let scrollView = otherGestureRecognizer.view as! UIScrollView
            if scrollView.contentOffset.x == 0 {
                return true
            }
        }
        
        return false
    }
    
    @objc func back() {
        self.popViewController(animated: true)
    }
}
