import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        setAppearance()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}


extension NavigationViewController {
    
    fileprivate func setAppearance() {
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}
