//
//  HTTPClien.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 18/08/21.
//

import Foundation
import Combine

struct RestClient{
    
    
    var session: URLSession
    
    static let shared = RestClient()
    
    var decoder : JSONDecoder
    
    init(configuration: URLSessionConfiguration, decoder:JSONDecoder? = nil) {
        self.session = URLSession(configuration: configuration)
        self.decoder = decoder ?? JSONDecoder()
    }
    
    private init(){
        self.init(configuration: .default)
    }
    
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    executionQueue: DispatchQueue = DispatchQueue.global(qos:.userInitiated),
                    recieverQueue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        return session.dataTaskPublisher(for: request)
            .subscribe(on: executionQueue )
            .tryMap {
                let response = $0.response as? HTTPURLResponse
                guard let responseH = response, StatusCode(rawValue: responseH.statusCode) == StatusCode.success else {
                    #if DEBUG
                        let json = try? JSONSerialization.jsonObject(with: $0.data, options: .allowFragments)
                        debugPrint(json ?? "")
                    #endif
                    throw ResponseError.invalidResponse
                }
                return $0.data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: recieverQueue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
    
    
    func execute(_ request: URLRequest,
                    executionQueue: DispatchQueue = DispatchQueue.global(qos:.userInitiated),
                    recieverQueue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<Void, Error> {

        return session.dataTaskPublisher(for: request)
            .subscribe(on: executionQueue )
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, StatusCode(rawValue: response.statusCode) == StatusCode.success else {
                    #if DEBUG
                    let json = try? JSONSerialization.jsonObject(with: $0.data, options: .allowFragments)
                    debugPrint(json ?? "")
                    #endif
                    throw ResponseError.invalidResponse
                }
            }
            .receive(on: recieverQueue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
    
    
    
    
}
