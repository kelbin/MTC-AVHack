import Foundation

 struct RequestBuilder {

    var timeoutInterval: TimeInterval = 20
     var customizationClosure: ((URLRequest) -> URLRequest)?

    func request(url: URLConvertible,
                 method: HTTPMethod,
                 parameters: Parameters? = nil,
                 headers: HTTPHeaders? = nil) -> URLRequest {
        let originalRequest = URLRequest(url: url, method: method, headers: headers, timeoutInterval: timeoutInterval)

        var customizedRequest = originalRequest
        if let customizationClosure = customizationClosure {
            customizedRequest = customizationClosure(customizedRequest)
        }

        guard let parameters = parameters else { return customizedRequest }
        
        let encoder = parameters.encoding
        let encodedRequest = encoder.encode(customizedRequest, with: parameters)

        return encodedRequest
    }

    func uploadRequest(url: URLConvertible,
                       method: HTTPMethod = .post,
                       fileURL: URL,
                       parameters: [String: Any]? = nil,
                       headers: HTTPHeaders? = nil) -> URLRequest {
        let originalRequest = URLRequest(url: url, method: method, headers: headers, timeoutInterval: timeoutInterval)

        let multipartData = MultipartData()
        let multipartRequest = multipartData.updateRequest(originalRequest,
                                                           fileURLs: [fileURL],
                                                           parameters: parameters)

        var customizedRequest = multipartRequest
        if let customizationClosure = customizationClosure {
            customizedRequest = customizationClosure(customizedRequest)
        }

        return customizedRequest
    }

}

extension URLRequest {

    init(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders? = nil, timeoutInterval: TimeInterval) {
        self.init(url: url.asURL(), cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)

        httpMethod = method.rawValue

        if let headers = headers {
            for (headerField, headerValue) in headers {
                setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
    }
}
