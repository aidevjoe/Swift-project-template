import UIKit


extension UIViewController {
    
    /// 查找指定类型的子控制器
    func findChildViewControllerOfType(_ klass: AnyClass) -> UIViewController? {
        for child in childViewControllers {
            if child.isKind(of: klass) {
                return child
            }
        }
        return nil
    }
}
