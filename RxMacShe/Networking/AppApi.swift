import Moya
import MoyaSugar

enum AppApi {
    case SignIn(email: String, password: String)
    case Signup()
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
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}

func stubbedResponse(filename: String) -> Data! {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
