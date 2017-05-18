import UIKit

extension UIColor {
    
    /// 快速构建rgb颜色
    ///
    /// - Parameters:
    ///   - r: r
    ///   - g: g
    ///   - b: b
    ///   - alpha: alpha
    /// - Returns: 返回rgb颜色对象，alpha默认1
    class func colorWith(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    
    /// 生成随机色
    ///
    /// - Returns: 返回随机色
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWith(r: r, g: g, b: b)
    }
    
    /// 16进制转UIColor
    ///
    /// - Parameters:
    ///   - hex: 16进制
    ///   - alpha: 不透明度
    /// - Returns: UIColor
    class func colorWith(hexString:String, alpha: CGFloat = 1) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
