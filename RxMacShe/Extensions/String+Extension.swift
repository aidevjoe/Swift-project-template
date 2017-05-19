import Foundation
import UIKit

extension String {
    
    /// 转换成 Int
    func toUInt() -> UInt? {
        return UInt(self)
    }
    
    /// 转换成 Int， 如果转换失败，返回默认值
    func toUIntWithDefault(defaultValue: UInt) -> UInt {
        return UInt(self) ?? defaultValue
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// 获取字符串长度
    var length : Int {
        return characters.count
    }
    
    /// 字符串大小
    func toSize(size: CGSize, fontSize: CGFloat, maximumNumberOfLines: Int = 0) -> CGSize {
        let font = UIFont.systemFont(ofSize: fontSize)
        var size = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).size
        if maximumNumberOfLines > 0 {
            size.height = min(size.height, CGFloat(maximumNumberOfLines) * font.lineHeight)
        }
        return size
    }
    
    /// 字符串宽度
    func toWidth(fontSize: CGFloat, maximumNumberOfLines: Int = 0) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        return toSize(size: size, fontSize: fontSize, maximumNumberOfLines: maximumNumberOfLines).width
    }
    
    /// 字符串高度
    func toHeight(width: CGFloat, fontSize: CGFloat, maximumNumberOfLines: Int = 0) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        return toSize(size: size, fontSize: fontSize, maximumNumberOfLines: maximumNumberOfLines).height
    }
}
