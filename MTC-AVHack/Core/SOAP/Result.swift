import Foundation

 enum Result<Value, ErrorValue> {
    case success(Value)
    case error(ErrorValue)
}

extension Result {

     var value: Value? {
        guard case .success(let v) = self else { return nil }
        return v
    }

     var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .error:
            return false
        }
    }

     var isFailure: Bool {
        return !isSuccess
    }
}
