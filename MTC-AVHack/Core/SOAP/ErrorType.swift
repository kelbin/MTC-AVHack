import UIKit

// MARK: - Error Enums

 enum ErrorType {
    
    case server(statusCode: Int, data: Data?)
    case network
    
     var isServerError: Bool {
        guard case .server = self else { return false }
        return true
    }

     var statusCode: Int? {
        guard case .server(let statusCode, _) = self else { return nil }
        return statusCode
    }

//     var json: JSON? {
//        guard case .server(_, let data) = self else { return nil }
//        guard let data = data else { return nil }
//        let json = try? JSON(data: data)
//        return json
//    }
//
//     var message: String? {
//        return json?["message"].string
//    }
    
     func statusCode(in codes: [Int]) -> Bool {
        guard let code = statusCode, codes.contains(code) else { return false }
        return true
    }
    
//     var infoViewType: InfoViewType {
//        switch self {
//        case .network: return .badNetwork
//        case .server: return .serverError
//        }
//    }
    
}
