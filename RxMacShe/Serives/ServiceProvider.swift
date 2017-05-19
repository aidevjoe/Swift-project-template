import Moya

protocol ServiceProviderType: class {
    var networking: Networking<AppApi> { get }
    var authService: AuthServiceType { get }
    var alertService: AlertServiceType { get }
}

final class ServiceProvider: ServiceProviderType {
    lazy var authService: AuthServiceType = AuthService(provider: self)
    lazy var networking: Networking<AppApi> = .init(plugins: [AuthPlugin(provider: self)])
    lazy var alertService: AlertServiceType = AlertService(provider: self)
}

