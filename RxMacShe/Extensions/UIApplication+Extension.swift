import UIKit

extension UIApplication {
    
    /// App版本
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    /// App构建版本
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    class func versionDescription() -> String {
        let version = appVersion()
        #if DEBUG
            return "Debug - \(version)"
        #else
            return "Release - \(version)"
        #endif
    }
}
