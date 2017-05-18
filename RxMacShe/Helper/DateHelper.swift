import UIKit

public final class DateManager {
    
    // MARK: - Properties
    
    static var SharedFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
