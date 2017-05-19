import UIKit

extension UIView {
    /**
     添加点击事件
     
     - parameter target: 对象
     - parameter action: 动作
     */
    public func addTapGesture(target : AnyObject,action : Selector) {
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
}
