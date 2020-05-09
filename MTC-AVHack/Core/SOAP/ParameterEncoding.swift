import Foundation

extension NSNumber {
    fileprivate var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}

 protocol ParameterEncoding {

    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) -> URLRequest
}

 struct URLEncoding: ParameterEncoding {

     func encode(_ urlRequest: URLRequest, with parameters: Parameters?) -> URLRequest {
        var urlRequest = urlRequest
        guard let parameters = parameters?.dictionary else { return urlRequest }

        if let method = HTTPMethod(rawValue: urlRequest.httpMethod ?? "GET"), (method == .get || method == .delete) {
            guard let url = urlRequest.url else { return urlRequest }

            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
                let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
                urlComponents.percentEncodedQuery = percentEncodedQuery
                urlRequest.url = urlComponents.url
            }
        } else {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = query(parameters).data(using: .utf8, allowLossyConversion: false)
        }

        return urlRequest
    }

     func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []

        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: "\(key)[]", value: value)
            }
        } else if let value = value as? NSNumber {
            if value.isBool {
                components.append((escape(key), escape((value.boolValue ? "1" : "0"))))
            } else {
                components.append((escape(key), escape("\(value)")))
            }
        } else if let bool = value as? Bool {
            components.append((escape(key), escape((bool ? "1" : "0"))))
        } else {
            components.append((escape(key), escape("\(value)")))
        }

        return components
    }

     func escape(_ string: String) -> String {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")

        let escaped = string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? string

        return escaped
    }

    private func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []

        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

struct JSONEncoding: ParameterEncoding {

     func encode(_ urlRequest: URLRequest, with parameters: Parameters?) -> URLRequest {
        var urlRequest = urlRequest
        guard let parameters = parameters else { return urlRequest }

        let params: Any = parameters.dictionary ?? parameters.array ?? ""
        let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let data = data {
            urlRequest.setValue("\(data.count)", forHTTPHeaderField: "Content-Length")
        }

        urlRequest.httpBody = data

        return urlRequest
    }
}
