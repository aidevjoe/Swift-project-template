import Moya
import MoyaSugar

enum AppApi {
    case SignIn(email: String, password: String)
    case Signup()
    case Posts()
}

extension AppApi: SugarTargetType {
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: Constants.BaseURL)!
    }
    
    /// method + path.
    var route: Route {
        switch self {
        case .SignIn:
            return .post("/login")
        case .Posts:
            return .get("posts")
        default:
            return .get("")
        }
    }
    /// encoding + parameters.
    var params: Parameters? {
        switch self {
        case .SignIn(let email, let password):
            return ["email": email, "password": password]
        default:
            return nil
        }
    }
    
    /// Returns HTTP header values.
    var httpHeaderFields: [String: String]? {
        return ["Accept": "application/json"]
    }
    
    /// The type of HTTP task to be performed.
    public var task: Task {
        return .request
    }
    
    var stubStatusCode: Int {
        return 200
    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        guard let stubFile = stubFileName(forStatusCode: stubStatusCode),
            let data = try? Data(contentsOf: URL(fileURLWithPath: stubFile)) else { return Data()
        }
        return data
    }
}

extension TargetType {
    
    func stubFileName(forStatusCode statusCode: Int = 200) -> String? {
        guard let stubsPath = ApiConstants.stubsPath else { return nil }
        if let selfString = "\(self)".components(separatedBy: "(").first {
            return "\(stubsPath)\(type(of: self))_\(selfString)_\(statusCode).json"
        } else {
            return "\(stubsPath)\(type(of: self))_\(self)_\(statusCode).json"
        }
    }
}

struct ApiConstants {
    
    /// Build Phases -> Run Script -> Path
    static var stubsPath: String? = {
        guard let infoPlist = Bundle.main.infoDictionary,
            let stubsPath = infoPlist["StubsDirectoryPath"] as? String else { return nil }
        
        return stubsPath
    }()
}
