import Moya

/// 进行网络请求时显示网络菊花
let NetActivityPlugin = NetworkActivityPlugin { activity in
    switch activity {
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
