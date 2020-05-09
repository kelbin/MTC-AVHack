import Foundation

 typealias HTTPHeaders = [String: String]
 typealias SuccessJSONResponse = (Any?)
 typealias SuccessResponse = (data: Data?, response: URLResponse?)
 typealias FailureResponse = (FailureInfo)

 struct FailureInfo {
     var data: Data?
     var response: AnyObject?
     var error: Error?
}

 enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

 final class NetworkClient {

     var session = URLSession.shared
     var requestBuilder = RequestBuilder()

     init() {}
    
     func request(url: URLConvertible,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 headers: HTTPHeaders? = nil,
                 responseHandler: @escaping (Result<SuccessResponse, FailureResponse>) -> Void) {
        
        let request = requestBuilder.request(url: url,
                                             method: method,
                                             parameters: parameters,
                                             headers: headers)

        session.dataTask(with: request) { data, response, error in
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode) else {
                let failureData = FailureInfo(data: data, response: response, error: error)
                responseHandler(.error(failureData))
                return
            }

            let result = (data: data, response: response)
            responseHandler(.success(result))
        }.resume()
    }

     func request(url: URLConvertible,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 headers: HTTPHeaders? = nil,
                 jsonResponseHandler: @escaping (Result<SuccessJSONResponse, FailureResponse>) -> Void) {
        
        let request = requestBuilder.request(url: url,
                                             method: method,
                                             parameters: parameters,
                                             headers: headers)

        session.dataTask(with: request) { data, response, error in
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode) else {
                let failureData = FailureInfo(data: data, response: response, error: error)
                jsonResponseHandler(.error(failureData))
                return
            }
            guard let data = data else {
                jsonResponseHandler(.success([:]))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                jsonResponseHandler(.success(json))
                debugPrint(json)
            } catch _ {
                let failureData = FailureInfo(data: data, response: response, error: error)
                jsonResponseHandler(.error(failureData))
            }
        }.resume()
    }

    func uploadRequest(url: URLConvertible,
                       method: HTTPMethod = .post,
                       fileURL: URL,
                       parameters: [String: Any]? = nil,
                       headers: HTTPHeaders? = nil,
                       responseHandler: @escaping (Result<SuccessResponse, FailureResponse>) -> Void) {
        
        let request = requestBuilder.uploadRequest(url: url,
                                                   method: method,
                                                   fileURL: fileURL,
                                                   parameters: parameters,
                                                   headers: headers)

        session.dataTask(with: request) { data, response, error in
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode) else {
                let failureData = FailureInfo(data: data, response: response, error: error)
                responseHandler(.error(failureData))
                return
            }

            let result = (data: data, response: response)
            responseHandler(.success(result))
        }.resume()
    }

     func uploadRequest(url: URLConvertible,
                       method: HTTPMethod = .post,
                       fileURL: URL,
                       parameters: [String: Any]? = nil,
                       headers: HTTPHeaders? = nil,
                       jsonResponseHandler: @escaping (Result<SuccessJSONResponse, FailureResponse>) -> Void) {

        
        let request = requestBuilder.uploadRequest(url: url,
                                                   method: method,
                                                   fileURL: fileURL,
                                                   parameters: parameters,
                                                   headers: headers)

        session.dataTask(with: request) { data, response, error in
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode) else {
                let failureData = FailureInfo(data: data, response: response, error: error)
                jsonResponseHandler(.error(failureData))
                return
            }
            guard let data = data else {
                jsonResponseHandler(.success([:]))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                jsonResponseHandler(.success(json))
                debugPrint(json)
            } catch _ {
                let failureData = FailureInfo(data: data, response: response, error: error)
                jsonResponseHandler(.error(failureData))
            }
        }.resume()
    }
}

 protocol URLConvertible {

    func asURL() -> URL
}

extension String: URLConvertible {

     func asURL() -> URL {
        guard let url = URL(string: self) else { return URL(string: "ya.ru")! }
        return url
    }
}

extension URL: URLConvertible {

     func asURL() -> URL { return self }
}
