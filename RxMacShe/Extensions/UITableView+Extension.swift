import UIKit

extension UITableView {
    
    /// 隐藏空的Cell
    func hideEmptyCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
