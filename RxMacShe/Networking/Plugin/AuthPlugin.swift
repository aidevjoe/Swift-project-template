import Moya
import Result

struct AuthPlugin: PluginType {
    
    fileprivate let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if let accessToken = self.provider.authService.currentAccessToken {
            request.addValue(accessToken.accessToken, forHTTPHeaderField: "access-token")
            request.addValue(accessToken.expiry, forHTTPHeaderField: "expiry")
            request.addValue(accessToken.client, forHTTPHeaderField: "client")
            request.addValue(accessToken.tokenType, forHTTPHeaderField: "token-type")
            request.addValue(accessToken.uid, forHTTPHeaderField: "uid")
        }
        return request
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .failure(_): ()
        case .success(let response):
            do {
                let text = try response.mapString()
                if let subsPath = target.stubFileName(forStatusCode: response.statusCode) {
                    try text.write(toFile: subsPath, atomically: true, encoding: .utf8)
                }
            } catch {
                log.error("记录请求有问题。这主要发生在你使用手机而不是模拟器时。如果它发生在模拟器上，请检查您的设置和路径")
            }
        
        }
    }
}
