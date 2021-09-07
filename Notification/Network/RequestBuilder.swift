//
//  RequestBuilder.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 17/08/21.
//

import Foundation
/**
 
 */
struct RequestBuilder {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let httpMethod: HTTPMethod
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Encodable? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = reqBody?.encode()
        self.httpMethod = httpMethod
    }
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Data? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = reqBody
        self.httpMethod = httpMethod
    }
    
    func builURLRequest() -> URLRequest? {
        let urlReq = URL(string: url)
        guard let urlReq = urlReq else { return nil }
        var urlRequest = URLRequest(url: urlReq)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = body
        if let headers = self.headers {
            for (key, value) in headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        return urlRequest
    }
    
    
}
