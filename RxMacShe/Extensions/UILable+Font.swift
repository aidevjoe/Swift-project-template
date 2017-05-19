import UIKit

extension UILabel {
    
    /// 设置指定文字[]大小
    func makeSubstringsBold(text: [String], size: CGFloat) {
        text.forEach { self.makeSubstringBold($0, size: size) }
    }
    
    /// 设置指定文字大小
    func makeSubstringBold(_ boldText: String, size: CGFloat) {
        let attributedText = self.attributedText!.mutableCopy() as! NSMutableAttributedString
        
        let range = ((self.text ?? "") as NSString).range(of: boldText)
        if range.location != NSNotFound {
            attributedText.setAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: size)], range: range)
        }
        
        self.attributedText = attributedText
    }
    
    /// 使指定文字添加删除线
    func makeSubstringStrikethrough(_ italicText: String) {
        let attributedText = self.attributedText!.mutableCopy() as! NSMutableAttributedString
        
        let range = ((self.text ?? "") as NSString).range(of: italicText)
        if range.location != NSNotFound {
            attributedText.setAttributes([NSStrikethroughStyleAttributeName: 1], range: range)
        }
        
        self.attributedText = attributedText
    }
    
    /// 设置行高
    func setLineHeight(_ lineHeight: Int) {
        let displayText = text ?? ""
        let attributedString = self.attributedText!.mutableCopy() as! NSMutableAttributedString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineHeight)
        paragraphStyle.alignment = textAlignment
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, displayText.characters.count))
        
        attributedText = attributedString
    }
    
    func makeTransparent() {
        isOpaque = false
        backgroundColor = .clear
    }
}
