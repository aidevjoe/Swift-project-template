import Foundation
import UIKit

struct Constants {
    
    static let ScreenWidth = UIScreen.main.bounds.width
    static let ScreenHeight = UIScreen.main.bounds.height
    static let TabBarHeight: CGFloat = 49
    
    static let BaseURL = "http://www.site.com/api"
    
    struct Error {
        static let InvalidEmail = "The email is not valid"
        static let InvalidPassword = "Your password is too short"
        static let InvalidName = "Name shouldn't be blank"
        static let WrongPassword = "wrong password"
        static let WrongEmail = "account not found"
        static let ExistingEmail = "Account already exists. Consider Sign in"
    }
    
    struct Color {
        static let GlobalColor = UIColor.colorWith(hexString: "3097D1")
    }
}
