import UIKit

class BaseViewController: UIViewController {

    // MARK: Properties
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Initializing
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    

    // MARK: Action    
    func cancelButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
