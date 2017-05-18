import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setAppearance()
        setupTabBar()
    }
}


extension TabBarViewController {
    
    fileprivate func setAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.colorWith(hexString: "515151")], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : Constants.Color.GlobalColor], for: .selected)
    }
    
    fileprivate func setupTabBar() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: R.image.toolbar_home.name)
        addChildViewController(childController: MemberViewController(), title: "会员", imageName: R.image.toolbar_member.name)
        addChildViewController(childController: BillViewController(), title: "账单", imageName: R.image.toolbar_bill.name)
    }
    
    fileprivate func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: "\(imageName)_sel")?.withRenderingMode(.alwaysOriginal)
        childController.title = title
        let nav = NavigationViewController(rootViewController: childController)
        nav.navigationBar.barTintColor = Constants.Color.GlobalColor
        nav.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor.white]
        nav.navigationBar.isTranslucent = false
        addChildViewController(nav)
    }
}
