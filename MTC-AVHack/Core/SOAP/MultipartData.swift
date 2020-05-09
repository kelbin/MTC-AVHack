import Foundation
import MobileCoreServices

 final class MultipartData {

    private class func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }

    private var boundaryString: String = MultipartData.generateBoundary()

    func updateRequest(_ request: URLRequest,
                       fileURLs: [URL],
                       parameters: [String: Any]? = nil,
                       filePathKey: String = "file") -> URLRequest {
        var requestToUpdate = request

        let contentType = "multipart/form-data; boundary=" + boundaryString
        requestToUpdate.setValue(contentType, forHTTPHeaderField: "Content-Type")
        let data = createBodyWithParameters(parameters: parameters, filePathKey: filePathKey, urls: fileURLs, boundary: boundaryString)
        requestToUpdate.httpBody = data
        requestToUpdate.setValue("\(data.count)", forHTTPHeaderField: "Content-Length")

        return requestToUpdate
    }

    private func createBodyWithParameters(parameters: [String: Any]? = nil,
                                          filePathKey: String = "file",
                                          urls: [URL]?,
                                          boundary: String) -> Data {
        var body = Data()

        if let parameters = parameters {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append("\(value)\r\n")
            }
        }

        if let urls = urls {
            for fileURL in urls {
                let data = try? Data(contentsOf: fileURL)
                let mimetype = mimeTypeForFile(at: fileURL)

                var fileName = fileURL.lastPathComponent
                if fileName.isEmpty {
                    fileName = (fileURL.path as NSString).lastPathComponent
                }
                if fileName.isEmpty {
                    fileName = "file"
                }

                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(fileName)\"\r\n")
                body.append("Content-Type: \(mimetype)\r\n\r\n")
                body.append(data ?? Data())
                body.append("\r\n")
            }
        }

        body.append("--\(boundary)--\r\n")
        
        return body
    }

    private func mimeTypeForFile(at url: URL) -> String {
        let pathExtension = url.pathExtension

        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
}

extension Data {
    
    mutating func append(_ string: String) {
        
        guard let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) else { return }
        
        append(data)
        
    }
}
