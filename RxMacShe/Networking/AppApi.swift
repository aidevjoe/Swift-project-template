import Moya
import MoyaSugar

enum AppApi {
    case Login(username: String, password: String)
    case Apps(page: Int)
}

extension AppApi: SugarTargetType {
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: Constants.BaseURL)!
    }
    
    /// method + path.
    var route: Route {
        switch self {
        case .Login:
            return .post("/login")
        default:
            return .get("")
        }
    }
    /// encoding + parameters.
    var params: Parameters? {
        switch self {
        case .Login(let username, let password):
            return ["username": username, "password": password]
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
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}
