import Foundation

 struct Parameters {

     enum Encoding {
        case json
        case url

         var encoder: ParameterEncoding {
            switch self {
            case .json: return JSONEncoding()
            case .url: return URLEncoding()
            }
        }
    }

     var _encoding: Parameters.Encoding = .url
     var _dictionary: [String: Any]?
     var _array: [Any]?

     var urlEncoded: Parameters! {
        if let dictionary = dictionary {
            return Parameters(dict: dictionary, encoding: .url)
        } else {
            return Parameters(array: array ?? [], encoding: .url)
        }
    }

     var jsonEncoded: Parameters! {
        if let dictionary = dictionary {
            return Parameters(dict: dictionary, encoding: .json)
        } else {
            return Parameters(array: array ?? [], encoding: .json)
        }
    }

     var dictionary: [String: Any]? {
        return _dictionary
    }

     var array: [Any]? {
        return _array
    }

     var encoding: ParameterEncoding {
        return _encoding.encoder
    }

     init(dict: [String: Any], encoding: Parameters.Encoding) {
        self._dictionary = dict
        self._encoding = encoding
    }

     init(array: [Any], encoding: Parameters.Encoding) {
        self._array = array
        self._encoding = encoding
    }

    subscript(index: String) -> Any {
        get {
            return _dictionary?[index] ?? ""
        }
        set {
            _dictionary?[index] = newValue
        }
    }
}

extension Parameters: ExpressibleByDictionaryLiteral {

     init(dictionaryLiteral elements: (String, Any)...) {
        var dict: [String: Any] = [:]
        for (key, value) in elements {
            dict[key] = value
        }
        self.init(dict: dict, encoding: .url)
    }
}

extension Parameters: ExpressibleByArrayLiteral {

     init(arrayLiteral elements: Any...) {
        self.init(array: elements, encoding: .url)
    }
}

extension Dictionary where Key == String, Value == Any {

     var urlEncoded: Parameters {
        return Parameters(dict: self, encoding: .url)
    }

     var jsonEncoded: Parameters {
        return Parameters(dict: self, encoding: .json)
    }
}

extension Array where Element == Any {

     var urlEncoded: Parameters {
        return Parameters(array: self, encoding: .url)
    }

     var jsonEncoded: Parameters {
        return Parameters(array: self, encoding: .json)
    }
}
