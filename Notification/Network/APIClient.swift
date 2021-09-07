//
//  APIClient.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 24/08/21.
//

import Foundation
import Combine


struct ApiClient{

    public var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .iso8601
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    public var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    private var client : RestClient
    
    static let shared = ApiClient()
    
    private init(){
        client = RestClient(configuration:.default,decoder:decoder)
    }
    
    
    
    
    func login(credentials:Credentials) -> AnyPublisher<TokenResponse,Error> {
        let url = APIConfig.shared.host + "/responsable/login"
        let headers = commonHeaders()
        let data = credentials.encode(with: encoder)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: data, httpMethod: HTTPMethod.POST)

        let request = builder.builURLRequest()
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: TokenResponse.self, queue: .main)
    }
    
    
    func getStays() -> AnyPublisher<[Stay],Error> {
        let url = APIConfig.shared.host + "/estancia"
        let headers = commonHeaders(requiresAuth: true)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: nil, httpMethod: HTTPMethod.GET)
        let request = builder.builURLRequest()
        
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: [Stay].self, queue: .main)
    }
    
    
    
    func getStay(stayId:Int) -> AnyPublisher<Stay?,Error>{
        let url = APIConfig.shared.host+"/estancia/\(stayId)"
        let headers = commonHeaders(requiresAuth: true)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: nil, httpMethod: HTTPMethod.GET)
        let request = builder.builURLRequest()
        
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: Stay?.self, queue: .main)
    }
    
    
    private func commonHeaders(requiresAuth:Bool = false) -> [String:String]{
        var headers : [String:String] = [
            "Content-type":"application/json",
            "Accept" :"application/json"
        ]
        if requiresAuth, let token = APIConfig.shared.apiToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
